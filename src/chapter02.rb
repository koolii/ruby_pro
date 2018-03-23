
puts 'abc'.class # String

a = 'xyz'
puts '* シングルクォートは変数展開されない #{a}'
puts "* ダブルクォートは変数展開される #{a}"

puts '* %q!, %Q!, %! を使って文字列を形成する関数もあるので必要になったら調べる'

hear_doc = <<TEXT
(ヒアドキュメント)識別子はこの文字列の中に入っていないものを入力すること
また、
* <<-XXXと言うように'-'を追加すると識別子をインデントさせられるから便利
* <<~XXXだと、先頭の空白部分が無視される
TEXT

puts hear_doc


def do_unless(arg)
  unless arg == 1 then
    puts 'NOT FIRST'
  end

  puts 'NOT SECOND' unless arg == 2
  puts '###################'
end
do_unless(1)
do_unless(2)
do_unless(3)

# デフォルト引数の設定
def do_case(arg = 0)
  # caseもdefと同様に最後の計算が返り値となる
  case arg
  when 1, 10 # 複数の値はカンマ区切りで設定可能
    100 * arg
  when 2, 20
    200 * arg
  when 3, 30
    300 * arg
  else
    # どれ にも 一致 し ない 場合 の 処理
    1000 * arg
  end
end
puts do_case(10)
puts do_case(2)
puts do_case(300)

# true/falseを返却する関数には、慣習として?を付けてわかりやすくする
def is_one?(arg)
  1 == arg
end

# !が付いている関数は、何かしらの注意が必要な処理が混入している
# ここだと引数の値を引数自体を変更して、元の値を書き換えてしまうという想定
# ポインタが渡ってるか不明なのでそういう想定
def is_one!(arg)
  arg = 1
  return arg
end
puts is_one?(1)
puts is_one?(2)
puts is_one!(1)
puts is_one!(2)

# 疑似変数
puts 'nil/true/falseも実は疑似変数で他には self/__FILE__/__LINE__/__ENCODING__がある'
puts "__FILE__: #{__FILE__}"
puts "__LINE__: #{__LINE__}"
puts "__ENCODING__: #{__ENCODING__}"

def check_object_id(arg)
  arg.object_id
end

variable = 10
puts "変数variableのobject_id(#{variable.object_id}), check_object_idに渡された引数のobject_id(#{check_object_id(variable)})"
puts '上を見るとわかるが、関数に渡された変数と渡した変数は同じ参照になっている'