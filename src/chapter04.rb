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