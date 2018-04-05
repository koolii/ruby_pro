# 5.4.1 シンボルでハッシュ
# ハッシュを作成しているが、key/value共にSymbolクラスになっている
# これらは同じオブジェクトになる。ただ、h11の方がアローが必要ないし、コロンの数も少ないからわかりやすい
h11 = { japan: :yen, us: :doller, india: :rupee }
h12 = { :japan => :yen, :us => :doller, :india => :rupee }
p h11 == h12

# 5.4.2
# jsみたいなハッシュの定義を行えばキーは全てシンボルになると考えて良い
person = {
  name: 'Alice',
  age: 20,
  gender: 'woman',
  friends: ['Bob' 'Carol'],
  phone: { home: '12345', mobile: '09876' },
}

p person[:name]
p person[:age]
p person[:gender]
p person[:friends]
p person[:phone]