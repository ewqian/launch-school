def substrings(str)
  ret_arr = []
  str.chars.each_index do |idx|
    (idx..str.length-1).each_with_object(ret_arr) { |i, arr| arr << str.chars[idx..i] }
  end
  ret_arr.map(&:join)
end

def palindromes(str)
  substrings(str).each_with_object([]) { |str, arr| arr << str if str == str.reverse && str.length > 1 }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]