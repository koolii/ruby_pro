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


