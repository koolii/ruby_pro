class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def full_name
    # クラス内でのインスタンス変数の参照は@を付ける付けないに関わらないらしい
    # ローカル変数が重複した時に@を付けることで区別が可能なのでそれは便利
    p first_name.object_id
    p @first_name.object_id
    "#{first_name} #{last_name}"
  end
end


users = []
users << User.new('Alice', 'Ruby', 20)
users << User.new('Bob', 'Python', 50)

users.each do |user|
  puts "Name: #{user.full_name}, Age: #{user.age}"
end
