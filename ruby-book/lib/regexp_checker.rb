def reg(text, pattern)
  begin
    regexp = Regexp.new(pattern)
    matches = text.scan(regexp)
    puts "---BEGIN---"
    if matches.size > 0
      puts "Matched: #{matches.join(',')}"
    else
      puts "Nothing matched."
    end
  rescue RegexpError => e
    puts "Invalid expression: #{e.message}"
  ensure
    puts "---END---\n\n"
  end
end

print "Text??:"
# text = gets.chomp
text = '123-456-789'

print "Pattern??:"
# pattern = gets.chomp
pattern = '[1-6]+'

puts text
puts pattern
reg(text, pattern)

text = 'abc-def-ghi'
pattern = '[1-6+'
puts text
puts pattern
reg(text, pattern)