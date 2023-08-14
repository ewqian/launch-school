def integer_to_string(int)
  conv_hash = (0..9).zip('0'..'9').to_h
  int.digits.reverse.each_with_object('') { |num, ret_str| ret_str << conv_hash[num] }
end

#p integer_to_string(4321) == '4321'
#p integer_to_string(0) == '0'
#p integer_to_string(5000) == '5000'

def signed_integer_to_string(int)
  return '0' if int == 0
  neg_int = int.abs != int ? true : false
  int *= -1 if neg_int
  conv_arr = ('0'..'9').to_a
  int_str = int.digits.each_with_object('') { |num, ret_str| ret_str.prepend(conv_arr[num]) }
  neg_int ? int_str.prepend('-') : int_str.prepend('+')
end

#p signed_integer_to_string(4321) == '+4321'
#p signed_integer_to_string(-123) == '-123'
#p signed_integer_to_string(0) == '0'

# Further Exploration
def signed_integer_to_string_fe(number)
  sign = (number <=> 0) < 0 ? '-' : ((number <=> 0) == 0 ? '' : '+')
  "#{sign}#{integer_to_string(number.abs)}"
end

p signed_integer_to_string_fe(4321) == '+4321'
p signed_integer_to_string_fe(-123) == '-123'
p signed_integer_to_string_fe(0) == '0'

