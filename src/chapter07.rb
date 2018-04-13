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