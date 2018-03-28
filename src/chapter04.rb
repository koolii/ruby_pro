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