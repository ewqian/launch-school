def stringy(int, start=1)
  str = start.to_s

  (int-1).times do
    if str[-1] == '1' then str << '0' 
    else str << '1' end
  end

  return str
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4,0)
puts stringy(7,0)