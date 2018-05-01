puts 'Start'
module Greeter
  def hello
    'hello'
  end
end

retry_count = 0

begin
  greeter = Greeter.new
  # Errorの型を指定すれば夫々のエラー毎に処理を分けることも可能だったりする
rescue NoMethodError => e
# rescue => e
  puts '-------------------------------'
  puts 'Rescue'
  puts '-------------------------------'
  puts "* Error class: #{e.class}"
  puts "* Error message: #{e.message}"
  puts "* Backtrace"
  puts e.backtrace
  puts '-------------------------------'

  retry_count += 1
  if retry_count <= 3
    puts "RETRY(#{retry_count})!!"
    retry
  else
    puts 'NO RETRY'
  end
rescue NameError, StandardError, Exception # この順番に継承が行われている(NoMethodError => Name => Standard => Exception)
  puts 'Exception'
  puts 'NoMethodErrorが先に実行されるから実際にはココは呼び出されない'
end
puts 'end'


# 9.3
def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    raise "invalid country. #{country}"
    raise ArgumentError, "invalid country. #{country}" # Errorを指定することも可能
  end
end

begin
  p currency_of(:japan)
  p currency_of(:italy)
rescue => e
  p e.message
end

# 9.6
begin
  # ファイルが存在しない場合は作成もしてくれるらしい
  file = File.open('some.txt', 'w')
  file << 'hi'
rescue
  p 'no file'
ensure
  p 'close'
  file.close
end

begin
  # ブロックで記述すればfile.closeを実行しなかったとしてもクローズ処理をしてくれる
  File.open('some.txt', 'w') do |file|
    file << 'Hello'
    1 / 0
  end
rescue
end

# 例外が発生しなかったときの処理も記述することが出来る
begin
  p 'hello'
  # 通常どおりに成功した場合はbegin節の最後の式が戻り値になる

  raise RuntimeError, 'test'
rescue
  p '例外が発生しました'
  # 例外が発生した場合はrescue節の最後の式が戻り値になる
  # rescue内で単純にraiseだけを行なうと、rescueした例外をそのまま再度raiseすることになる
  raise
else
  p '例外が発生しませんでした'
ensure
  p '終了'
  # もしもensure節にreturnを書いてしまうと、
  # 正常異常終了にかかわらずreturnで指定したものが帰ってしまうので注意
end