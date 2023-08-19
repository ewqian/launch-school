def swapcase(str)
  str.chars.each_with_object('') do |char, ret_str|
    ret_str << (char == char.upcase ? char.downcase : char.upcase)
  end
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'