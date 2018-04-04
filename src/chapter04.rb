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
