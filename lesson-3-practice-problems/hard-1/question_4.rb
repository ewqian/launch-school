def is_an_ip_number?(str)
  str.match?(/\A(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\z/)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.length != 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  return true
end

p dot_separated_ip_address?('10.4.5.11')
p dot_separated_ip_address?('1000.4.25.11')
p dot_separated_ip_address?('1.2.3.4.5')