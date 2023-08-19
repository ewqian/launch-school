def leading_substrings(str)
  (0..str.length-1).each_with_object([]) { |idx, arr| arr << str[0..idx] }
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']