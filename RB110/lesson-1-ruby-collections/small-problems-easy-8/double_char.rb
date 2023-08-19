def repeater(str)
  str.chars.map { |char| char*2 }.join
end

#p repeater('Hello') == "HHeelllloo"
#p repeater("Good job!") == "GGoooodd  jjoobb!!"
#p repeater('') == ''

def double_consonants(str)
  str.chars.map { |char| char.match?(/[b-df-hj-np-tv-z]+/i) ? char*2 : char }.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""