def century(num)
  num_digits = num.to_s.length > 3 ? num.to_s.length - 3 : 0
  c_str = num.ceil(-2).to_s[0..num_digits]

  if (c_str.to_i % 100).to_s[0] == '1' && c_str.length > 1
    c_str.to_s << 'th'
  else
    case c_str.to_i % 10
      when 1
        c_str.to_s << 'st'
      when 2
        c_str.to_s << 'nd'
      when 3
        c_str.to_s << 'rd'
      else
        c_str.to_s << 'th'
    end
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
  