require 'pry'

# This unexepected behavior is happening because we're iterating through an array while also mutating it at the same time
# Every time we delete a word we're skipping the next word
# This happens because `each` method maintains its place via the current array's index when iterating

# Fixed code
NEGATIVE_WORDS = [ 'dull', 'boring', 'annoying', 'chaotic' ]

def neutralize(sentence)
  words = sentence.split(' ')
  NEGATIVE_WORDS.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  NEGATIVE_WORDS.include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.