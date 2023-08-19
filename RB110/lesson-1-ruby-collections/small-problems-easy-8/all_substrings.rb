def substrings(str)
  ret_arr = []
  str.chars.each_index do |idx|
    (idx..str.length-1).each_with_object(ret_arr) { |i, arr| arr << str.chars[idx..i] }
  end
  ret_arr.map(&:join)
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]