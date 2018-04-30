module Loggable
  private

  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  # クラスにモジュールをincludeして機能を追加することを mixin と言う
  include Loggable

  def title
    log 'title is called.'
    'A great movie'
  end
end

class User
  include Loggable

  def name
    log 'name is called.'
    'Alice'
  end
end

product = Product.new
p product.title

user = User.new
p user.name

# Loggableモジュールがprivateアクセスのみを許可しているので、クラス内部からメソッドを呼び出すことはできない
# user.log 'public call'


class Product2
  # moduleのメソッドをそのままクラス・メソッドとして定義する
  extend Loggable

  def self.create_products(names)
    log "create_products is called (names: #{names})"
  end
end

Product2.create_products(['apple', 'banana', 'strawberry'])

# Loggableのlogがprivateなので同様に直接呼び出せない
# Product2.log('private')


# includeしてるからtrueになる
p "Include Loggable module in Product class => #{Product.include?(Loggable)}"
# extendしてるからfalseになる
p "Include Loggable module in Product2 class => #{Product2.include?(Loggable)}"

p "Included moudles in Product class => #{Product.included_modules}"
p "Ancestors in Product class => #{Product.ancestors}"

# ↑と同じことをオブジェクトからクラスオブジェクトを取得して行なうことも可能
p "Include Loggable module in User class from instance => #{p user.class.include?(Loggable)}"


module Tagglable
  def price_tag
    # Tagglableを使用しているクラスがpriceメソッドを必ず持っていると想定してprice_tagメソッドを作成している例
    "#{price} yen"
  end
end

module NameChanger
  def change_name
    p 'call NameChanger.change_name'
    @name = 'bokuhakuma'
    self.name2 = 'polar bear'
  end
end

# このnameはダメな例で出来るならmixinとのインスタンス変数の共通編集は避けたい(ソースも追いづらいし)
# なので、attr_accessorのsetterを使って、やり取りをするname2が良さげとのこと
# (今回はsetterだったが、違うメソッドを定義して、それを呼び出す=interfaceのようなやり方が良い)
class UserName
  include NameChanger
  attr_reader :name
  attr_accessor :name2

  def initialize(name)
    @name = name
    @name2 = name
  end
end

userName = UserName.new('bear')
p userName.name
p userName.name2
userName.change_name
p userName.name
p userName.name2


# 8.6 モジュールで名前空間を作成して、競合を避ける
module Baseball
  class Second
    def initialize(player, uniform_num)
      @player = player
      @uniform_num = uniform_num
    end
  end
end

module Clock
  class Second
    def initialize(digits)
      @digits = digits
    end
  end
end

class Baseball::Third
  def initialize(player, uniform_num)
    @player = player
    @uniform_num = uniform_num
  end
end

baseball = Baseball::Second.new('Alice', 13)
baseball2 = Baseball::Third.new('Tom', 21)
clock = Clock::Second.new(13)

p baseball
p clock
p baseball2

# todo
# 一応最初からmoduleがない状態からFiber::Oneを定義しても正常に動作する
# これは単純にモジュールFiberを作成して、そこからクラスを生やしているのか
# はたまた、ただ、Fiber::Oneと言うクラスを作成しているだけなのかがわかっていない
class Fiber::One
end
fiber = Fiber::One.new()
p fiber

# またトップレベルのクラスを呼び出す時はクラス名の前に :: を追加することで明示的に指定することが可能
nameX = ::UserName.new('anthem')
p nameX.name

# 8.7
module Logger
  # 定数
  PREFIX = '[LOG]'.freeze

  def log(text)
    p "#{PREFIX} #{text}"
  end

  # 別クラスからmixinしなくてもメソッドを利用出来るように
  # Logger.log()で呼び出せる
  module_function :log
end

class ProductLogger
  # module_functionで定義したlogは ProductLoggerクラス内部ではprivate修飾子になる
  include Logger

  def title
    log 'title is called.'
    'A greate movie'
  end
end

productLogger = ProductLogger.new()
productLogger.title

# Mathモジュールはビルトインが豊富なモジュール
class Calculator
  include Math
  def calc_sqrt(n)
    sqrt(n)
  end
end
calculator = Calculator.new()
p calculator.calc_sqrt(2)

# 8.8 状態を保持するモジュール
# モジュールはインスタンス化ができないので、実質１つしか存在しないので、ある意味シングルトンということも出来るかも
# クラスでシングルトンを実装したいならSingletonモジュールがあるのでそれを使うと良い
module AwesomeApi
  @base_url = ''
  @debug_mode = false

  # これどういう意味だっけ？クラスメソッドを定義している気がする
  class << self
    def base_url=(value)
      @base_url = value
    end

    def base_url
      @base_url
    end

    def debug_mode=(value)
      @debug_mode = value
    end

    def debug_mode(value)
      @debug_mode
    end
  end
end

# 8.9
# 継承やモジュールのinclude等で複数の同名メソッドが存在する場合は全てが呼ばれるっぽい
# 呼ばれる順番に関してはClass.ancestorsを実行すれば配列オブジェクトが返ってくるのでその順番通りに動作するっぽい

# モジュールのincludeと似たような機能として prependを使ってモジュールをmixinさせることが出来て、
# 特徴としては同名のメソッドが有った時に、ミックスインしたクラスよりも先にモジュール側のメソッドが呼ばれる

module A
  def to_s
    "<A> #{super}"
  end
end

class Product9
  # insteads of "include"
  prepend A

  def to_s
    "<Product> #{super}"
  end

  def name
    "A great file"
  end
end

# ここの出力が本と違う
# includeを使用した場合は <Product> <A> ...となる
# <A> <Product> #<Product9:0x00007fe71f9304f0> と言う出力に成った。
product9 = Product9.new
p product9.to_s
p product9.name
# [A, Product9, Object, Kernel, BasicObject]
# 上記を見れば分かるが、モジュールが先に読み込まれてしまっている
p Product9.ancestors

module NameDecorator
  def name
    "<<#{super}>>"
  end
end

class Product9
  prepend NameDecorator
end

product91 = Product9.new
# 最初に定義したnameメソッドがNameDecoratorのnameメソッドに上書きされていることが分かる
p product91.name

class PrependUser
  def name
    'Alice'
  end
end
class PrependUser
  prepend NameDecorator
end

prependUser = PrependUser.new
p prependUser.name

# refinementsはスルー