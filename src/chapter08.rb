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
