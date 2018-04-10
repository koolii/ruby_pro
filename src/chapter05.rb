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

def buy_burger(menu, drink:, potato:)
  p('buy_burger')
  p(menu)
  p(:drink)
  p(:potato)
end
buy_burger('menu', drink: true, potato: true)
buy_burger('menu', potato: false, drink: false)

# 5.6

# jsのオブジェクトの展開がRubyでは **で表現
h = { us: 'doller', india: 'rupee' }
h = { japan: 'yen', **h }
p h

# jsと同様に一番最後の引数をハッシュにしたメソッドはいくらでも配置できる
def buy_burger(menu, drink: true, potato: true, **others)
  puts others
end

buy_burger('fish', drink: true, potato: false, salad: true, chicken: false)


def buy_burger2(menu, options = {})
  puts options
end
# 最後の引数がハッシュなら呼出し元は{}を省略できる(ただし、最後でなければ{}が必須)
buy_burger2('fish', 'drink' => true, 'potato' => false)

# Rubyでのメソッド呼び出しで()を省略するときの注意点は第一引数がハッシュだと()無しだと{}がブロックだと判断されてしまいエラーとなる
# なので第二引数以降がハッシュなら()を省略することが出来る

buy_burger2 'fish', { drink: true, potato: false }
buy_burger2 'fish', drink: true, potato: false

# hash <=> array
p [[:japan, 'yen'], [:japan, '円']].to_h
p [[:japan, 'yen'], [:us, 'doller'], [:india, 'rupee']].to_h

# ハッシュの初期化は配列の初期化と同じで Hash.new() や Hash.new {} で定義出来るが内容は配列と同じ
# 中でも便利そうだったのが特定のハッシュキーと値の初期化を行なう Hash.new {} 記法
h = Hash.new { |hash, key| hash[key] = 'hello' }
p h[:foo]
p h[:bar]
p h # foo,barに初期値のhelloが格納されている

# 5.7
# 普通は数値だけだとシンボル化できないが文字列で囲めば可能
p :'12345'
p :'ruby:is funny'

# 文字列から通常のシンボルを生成する
# ダブルクォートを使えば可能
name = 'Alice'
p :"#{name.upcase}"

# ハッシュでキーを文字列として使う
hash = { 'abc': 123 }
p hash

# %i()でシンボルの配列を作れる
hash = %i(apple orange melon watermelon)
p hash

string = 'apple'
symbol = :apple

# to_symで文字列をシンボルに変換する
p string == symbol
p string.to_sym == symbol
p string == symbol.to_s