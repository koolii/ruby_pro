p [].class

a = []
a << 1
a << 2
a << 3
a << 4
a << 5
a << 6
p a

a.delete_at(0)
p a

b, c = [10]
p b
p c

numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
  sum += n
end

p sum

a = [1,2,3,4,3,2,1,2,2,2]
a.delete(2)
p a

# 中身は[].filter()と同様
a.delete_if do |n|
  n.odd?
end
p a

# 一行で記述する
# ↓の記述の方が良い
sum = 0
[1,2,3,4].each do |n| sum += n end
p sum

# {}を使う 1行でコンパクトに書くならこっちの記述を使う
sum = 0
[1,2,3,4].each { |n| sum += n }
p sum

# 4.4
# Map
new_numbers = []
[1,2,3,4,5].each { |n| new_numbers << n * 10 }
p new_numbers

new_numbers = [1,2,3,4,5].map { |n| n * 10 }
p new_numbers

# Select
even_numbers = [1,2,3,4,5].select { |n| n.even? }
p even_numbers

non_multiples_of_three = [1,2,3,4,5].reject { |n| n %3 == 0 }
p non_multiples_of_three

# Find
# jsで言うところの[].some()で、最初にtrueになった値を返す
even_number = [1,2,3,4,5,6].find { |n| n.even? }
p even_number

# Inject
sum = 0
[1,2,3,4].each { |n| sum += n }
p sum

# ↑の処理はinjectで書くと
# resultはinject()の第一引数が割り当てられる
sum = [1,2,3,4].inject(0) { |result, n| result + n }
p sum
sum = [1,2,3,4].inject(10) { |result, n| result + n }
p sum


# &とシンボルで簡潔に
# * ブロック引数(今回だとs,n)が1つだけで
# * 呼び出すメソッドに引数がない
# * 一度だけメソッドを呼出して終了する
p ['ruby', 'java', 'perl'].map { |s| s.upcase }
p ['ruby', 'java', 'perl'].map(&:upcase)

p [1,2,3,4,5].select { |n| n.odd? }
p [1,2,3,4,5].select(&:odd?)

# こういう↓ものは簡潔にはかけない
p [1,2,3,4,5,6].select { |n| n % 3 == 0 }
p [9, 10, 11, 12].map { |n| n.to_s(16) }


# 4.5
p "[4.5]"
p (1..5).class
p (1...5).class

# ..
range = 1..5 # 1以上5以下
p range.include?(0)
p range.include?(1) # WARNING
p range.include?(5) # WARNING
# ...
range = 1...5 # 1以上5未満
p range.include?(0)
p range.include?(1) # WARNING
p range.include?(5) # WARNING

a = [10,20,30,40,50]
p a[1..3] # 2,3,4番目の要素を取得する(文字列でも同様)

# Rangeクラスのn以上m以下、n以上m未満と言う特徴を使う
# 0℃以上100℃未満を液体とする
def a_liquid?(temperature)
  p 0 <= temperature && temperature < 100
end
def b_liquid?(temperature)
  p (0..100).include?(temperature)
end
a_liquid?(-1)
a_liquid?(0)
a_liquid?(99)
a_liquid?(100)
b_liquid?(-1)
b_liquid?(0)
b_liquid?(99)
b_liquid?(100)

# caseでRangeクラスを使う
def price(age)
  case age
  when 0..5
    0
  when 6..12
    300
  when 13..18
    600
  else
    1000
  end
end
p price(3)
p price(12)
p price(16)
p price(25)

# stepメソッドでステップアップするカウントを調整する
numbers = []
(1..10).step(2) { |n| numbers << n }
p numbers

# 4.7.1
# インデックス指定で取得できる
p [1,2,3,4,5].values_at(0,2,4)
# 一番後ろの要素を取得
p [1,2,3][-1]
p [1,2,3].last
# 最後か２番目から２つ
p [1,2,3][-2, 2]
p [1,2,3].last(2)
# 逆に先頭をしゅとくする
p [1,2,3].first
p [1,2,3].first(2)

# 4.7.2
a = []
# << 以外で配列に要素を追加する
a.push(2,3)
p a

# 指定した値の要素を削除する
a = [1,2,3,1,2,3]
a.delete(2)
p a

# 4.7.3
# 配列の結合(concatメソッドはjsと違ってconcatを呼び出した配列自信を変更する)
a = [1]
b = [2,3]
a.concat(b)
p a
p b
a = [1]
p a
p b
# 元の配列に変化を加えず新しい配列を作成する
p a + b

# 4.7.4
a = [1,2,3]
b = [3,4,5]
# 重複がないように配列を合わせる
p a | b
# 元の配列から重複する要素を削除する
p a - b
# ２つの配列に重複する要素を取得
p a & b

# 4.7.5
# *を付けると多重代入でfは配列になる
e, *f = 100, 200, 300
p e
p f

# 4.7.6
# 配列に配列をタダpushすると二重配列に成ってしまうが、
# １つの配列をそのままconcat()するならば*を使う
a = [1]
b = [2,3]
a.push(*b)
p a

# 4.7.7
# 同様に可変長引数にも使える
def greeting(*names)
  "#{names.join(' and ')}, Hello!!"
end
p greeting('tanaka', 'suzuki')

# 4.7.9
# ==で配列を比較する時は、すべての要素が等しい場合にtrueとなる
p [1,2,3] == [1,2,3]
p [1,2,3] == [1,2,3,3]

# 4.7.10 で%記法で文字列を配列にすることが出来る
# 4.7.11 jsと同じsplit
p 'Ruby,Java,PHP,Perl'.split(',')

# 4.7.12 配列を生成し、個数、初期値を設定する
a = Array.new(5, 1)
p a
# 初期化する時に、ブロックを適用させる
a = Array.new(10) { |n| n % 3 + 1 }
p a

# 4.7.13
# 全ての要素がdefaultを参照しているのでdefaultを破壊的に変更すると全ての要素が適用されてしまう
# これは１つの要素を定義するだけで変わる(1回)
# ただ、イミュータブルなクラス（Integery,FloatやSymbol,nil,boolean等）ならば第二引数に適用しても問題はない
a = Array.new(5, 'default')
str = a[0]
str.upcase!
p a
# ブロックを使うと、一つ一つの配列を初期化してくれる(n回)
a = Array.new(5) { 'default' }
str = a[0]
str.upcase!
p a


# 4.8.2
fruits = ['apple', 'orange', 'melon']

# jsのforEach(obj, index)みたいにindexを使いたい
fruits.each_with_index { |fruit, i| puts "#{i}: #{fruit}" }

# eachの場合は each_with_indexがあるが、mapや他のメソッドにはないので、with_indexと言うメソッドを使う
fruitStrList = fruits.map.with_index { |fruit, i| "#{i}: #{fruit}" }
p fruitStrList

fruits.delete_if.with_index { |fruit, i| fruit.include?('a') && i.odd? }
p fruits

# 4.8.3
# each_with_indexだと必ず初期値が0スタートになるので、変更したい場合はeach.with_index(n)を使う
fruits = ['apple', 'orange', 'melon']
fruits.each.with_index(100) { |fruit, i| puts "#{i}: #{fruit}"}
p fruits.map.with_index(200) { |fruit, i| "#{i}: #{fruit}"}

# 4.8.4
# ループで繰り返す要素が配列で、しかもその配列を一つ一つ変数に格納するのではなく一括で定義したい
dimensions = [
  [10, 20],
  [30, 40],
  [50, 60],
]

areas = []
dimensions.each do |length, height|
  areas << length * height
end
p areas

areas = dimensions.map.with_index(200) do |(length, height), i|
  area = length * height
  p "#{i}: area: #{area}"
  area
end
p areas

# 4.8.7
# do...endと{}はほぼ同じ意味を持つが、{}が優先順位が高く、意図した動作をしないものもある
a = [1,2,3]

# deleteにブロックを続けるとdeleteするものがなかった場合のデフォルト値を設定可能
result = a.delete(100) do 'NG' end
p result
p a.delete(100) do 'NG' end # ここはなぜかnilになる(why does return is nil?)
p a.delete(100) {'NG'}
p a.delete(1) {'NG'}

# ここでdeleteを実行する()をなくすと、
result = a.delete 100 do 'NG' end
p result
# WARN:::: ↓は 100 { 'NG' } が優先度的に先に処理されてしまい、エラーが発生してしまう。
# なので、明示的に delete(100) でdeleteメソッドの引数として100を指定する必要がある
# p a.delete 100 {'NG'}

# 4.9.1
sum = 0
10.times { |i| sum += i }
p sum

# 4.9.2
upto = []
# 10,11,12,13,14,15の配列になるので、10以上15以下の制限
10.upto(15) { |n| upto << n }
p upto

downto = []
# この時は何も処理されず空配列になる
10.downto(15) { |n| downto << n }
p downto
15.downto(10) { |n| downto << n }
p downto

# 4.9.3
step = []
# 最初のスタートが1で、intervalが5なので、1 + 5 = 6, 6 + 5 = 11と言うような配列となる
# 0スタートがやりやすいかな
1.step(100, 5) { |n| step << n }
p step
step = []
0.step(100, 5) { |n| step << n }
p step
# マイナス値からでも問題なく実行できる
step = []
-20.step(100, 5) { |n| step << n }
p step

# 4.9.4 はwhileだしスルー
# untilのサンプルもあるが、untilはあんまり好きじゃない
# 4.9.5
# ここのnumはスコープ的に最後の値が保持し続けてしまうので注意が必要そう
for num in [1,2,3,4,5]
  p num
end
[1,2,3,4,5].each do |n|
  p n
end

p num

numbers = [1,2,3,4,5]
p 'loop start'
# while trueでも出来る
loop do
  n = numbers.sample
  p n
  break if n == 5
end