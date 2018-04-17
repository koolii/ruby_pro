class User
  attr_reader :first_name, :last_name, :age

  puts "User class: #{self}"

  DEFAULT_AGE = 0
  DEFAULT_LAST_NAME = '(unknown)'

  # オーバーロードはできないみたい、引数が１つのinitializeを作成しようとしたが出来なかった
  def initialize(first_name, last_name = DEFAULT_LAST_NAME, age = DEFAULT_AGE)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def full_name
    # クラス内でのインスタンス変数の参照は@を付ける付けないに関わらないらしい
    # ローカル変数が重複した時に@を付けることで区別が可能なのでそれは便利
    # p first_name.object_id
    # p @first_name.object_id
    "#{first_name} #{last_name}"
  end

  def self.ageOut(age)
    "Age: #{@age}"
  end

  # self.を付けるとクラスメソッドになる
  def self.create_users(names)
    names.map do |name|
      User.new(name, '', 0)
    end
  end

  def hello
    # User.ageOutはクラスメソッドになっている
    # self.class.ageOUt()という呼出し方も可能
    puts "HELLO!! This is my information => Name: #{full_name}, #{User.ageOut(@age)}"
  end
end


users = []
users << User.new('Alice', 'Ruby', 20)
users << User.new('Bob', 'Python', 50)

users.each do |user|
  user.hello
end

names = ['Alice', 'Bob', 'Carol']
users = User.create_users(names)
users.each do |user|
  user.hello
end



class Product
  attr_reader :name, :price, :code

  STATIC = 100
  STATIC = 1000.freeze
  SOME_NAMES = ['Foo'.freeze, 'Bar'.freeze].freeze
  # または
  SOME_NAMES2 = ['Foo', 'Bar'].map(&:freeze).freeze

  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
  end

  def ==(other)
    # Productクラスのオブジェクトだったら
    if other.is_a?(Product)
      code == other.code
    else
      false
    end
  end

  # private

  def to_s
    "name: #{name}, price: #{price}"
  end

  private

  def prefix
    "[Product]"
  end

  # prefixメソッドのエイリアスのpメソッドを定義
  alias p prefix
end

# Product.freeze
# freezeをすれば定数への再代入を防ぐことが出きるがクラスごとやるケースは少ない
# なので、定数単位でfreezeさせる
# Product.STATIC = 10000

product = Product.new('000', 'A great movie', 1000)
p product.name
p product.price
p product.to_s


class DVD < Product
  attr_reader :running_time

  # 継承クラスで特にinitizlizeを定義しなければsuper()が自動的に実行される
  def initialize(code, name, price, running_time)
    super(code, name, price)
    @running_time = running_time
  end

  # superを呼び出すと親クラスの同一メソッドが呼び出される
  # でもprivateになってるProduct.to_sはここから呼び出すとエラーになった
  def to_s
    "#{p} #{super}, => extra: running_time: #{running_time}"
  end
end

dvd = DVD.new('DVD000', 'A great movie', 1000, 120)
p dvd.name
p dvd.price
p dvd.running_time
p dvd.to_s

p1 = Product.new('A001', 'A nice movie', 100)
p2 = Product.new('N002', 'A bad movie', 10000)
p3 = Product.new('A001', 'A wonderful movie', 1000)

# 普通なら == だとそれぞれの object_idがそれぞれ比較されて判定が行われるが
# この部分も任意の実装に変更することが出来る
# Product.==()を確認すると分かる
p p1 == p2
p p1 == p3