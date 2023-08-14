require 'pry'

def string_to_integer_1(str)
  sum = 0
  mult = 1
  str.reverse.each_char do |char|
    sum += (char.ord - 48) * mult
    mult *= 10
  end
  sum
end

#p string_to_integer_1('4321') == 4321
#p string_to_integer_1('570') == 570

def string_to_integer(str)
  num_hash = ('0'..'9').zip(0..9).to_h
  str.chars.reduce(0) do |sum, char| 
    10*sum + num_hash[char]
  end
end

#p string_to_integer('4321') == 4321
#p string_to_integer('570') == 570

def string_to_signed_integer(str)
  neg_num = str.include?('-')
  str.sub!(/[+-]/,'')

  num_hash = ('0'..'9').zip(0..9).to_h
  ret_num = str.chars.reduce(0) do |sum, char| 
    10*sum + num_hash[char]
  end

  neg_num ? -ret_num : ret_num
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100