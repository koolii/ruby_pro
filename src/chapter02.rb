
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
def isOne?(arg)
  1 == arg
end

# !が付いている関数は、何かしらの注意が必要な処理が混入している
# ここだと引数の値を引数自体を変更して、元の値を書き換えてしまうという想定
# ポインタが渡ってるか不明なのでそういう想定
def isOne!(arg)
  arg = 1
  return arg
end
puts isOne?(1)
puts isOne?(2)
puts isOne!(1)
puts isOne!(2)
