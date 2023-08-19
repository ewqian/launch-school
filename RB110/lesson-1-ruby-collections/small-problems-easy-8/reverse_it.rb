def reverse_sentence(str)
  str.split.reverse.join(' ')
end

#puts reverse_sentence('Hello World') == 'World Hello'
#puts reverse_sentence('Reverse these words') == 'words these Reverse'
#puts reverse_sentence('') == ''
#puts reverse_sentence('    ') == '' # Any number of spaces results in ''

def reverse_words_pt2(str)
  str.split.map { |word| word.length >= 5 ? word.reverse : word }.join(' ')
end

puts reverse_words_pt2('Professional')          # => lanoisseforP
puts reverse_words_pt2('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words_pt2('Launch School')         # => hcnuaL loohcS