require 'pry'

def rotate_array(arr)
  ret_arr = Array.new(arr)
  ret_arr.shift
  ret_arr.push(arr[0])
end

# Part 1 - Further Exploration
def rotate_string(str)
  str[1..-1] + str[0]
end

def rotate_integer(int)
  rotate_string(int.to_s).to_i
end

#p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
#p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
#p rotate_array(['a']) == ['a']

#p x = [1, 2, 3, 4]
#p rotate_array(x) == [2, 3, 4, 1]   # => true
#p x == [1, 2, 3, 4]                 # => true

#p rotate_string("Hello")
#p rotate_integer(6300)
#p rotate_integer(9)


# Part 2
def rotate_rightmost_digits(num, n)
  numstr = num.to_s
  str1 = numstr[0..-(n+1)]
  str2 = numstr[-n..-1]
  (str1 + rotate_array(str2.chars).join).to_i
end

#p rotate_rightmost_digits(735291, 1) == 735291
#p rotate_rightmost_digits(735291, 2) == 735219
#p rotate_rightmost_digits(735291, 3) == 735912
#p rotate_rightmost_digits(735291, 4) == 732915
#p rotate_rightmost_digits(735291, 5) == 752913
#p rotate_rightmost_digits(735291, 6) == 352917


# Part 3
def rotate_rightmost_digits_str(numstr, n)
  str1 = numstr[0..-(n+1)]
  str2 = numstr[-n..-1]
  str1 + rotate_array(str2.chars).join
end

def max_rotation(num)
  num_str = num.to_s
  (0..num.digits.length-2).each do |idx|
    num_str = rotate_rightmost_digits_str(num_str, num_str.chars.length - idx)
  end
  num_str.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
