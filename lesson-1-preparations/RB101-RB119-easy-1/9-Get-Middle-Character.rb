def center_of(str)
  if str.length.odd?
    return str[str.length/2]
  else
    return "#{str[(str.length/2) - 1]}#{str[str.length/2]}"
  end
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'