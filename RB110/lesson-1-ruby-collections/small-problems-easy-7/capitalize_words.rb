def word_cap(str)
  str.split.each { |word| word.capitalize! }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

def word_cap_fe(str)
  str.split.map do |word|
    word.chars.each_with_index do |char, idx|
      char.downcase!
      char.upcase! if idx == 0
    end.join
  end.join(' ')
end

p word_cap_fe('four score and seven') == 'Four Score And Seven'
p word_cap_fe('the javaScript language') == 'The Javascript Language'
p word_cap_fe('this is a "quoted" word') == 'This Is A "quoted" Word'