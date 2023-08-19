require 'pry'

def crunch(str)
  str.chars.each_with_object([]) { |char, arr| arr << char if arr.last != char }.join
end


p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''