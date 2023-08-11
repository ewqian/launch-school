# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

def get_substrings(str)
  substrings = []
  
  for i in (0..(str.length - 2))
    for idx in ((i + 1)..(str.length - 1))
      substrings << str[i..idx]
    end
  end

  substrings
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  result_arr = []
  substrings = get_substrings(str)

  substrings.each do |val|
    result_arr << val if is_palindrome?(val)
  end

  result_arr
end


# Test cases:

p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []