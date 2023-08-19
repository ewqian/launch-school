def penultimate(str)
  str.split[-2]
end

#p penultimate('last word') == 'last'
#p penultimate('Launch School is great!') == 'is'

# Further Exploration
## Edge Cases:
## Strings with one word -> Return that word
## Empty strings -> Return an empty string
## String with even # of words -> Return both words seperated by a space
## String of empty spaces -> Return an empty string
## Argument is not a string -> Return nil

def penultimate_fe(str)
  return nil if str.class != String
  return '' if str.empty? || str.split.length == 0
  fetch = str.split.length.odd? ? str.split.length/2 : ((str.split.length/2 - 1)..str.split.length/2)
  str.split.length.odd? ? str.split[fetch] : str.split[fetch].join(' ')
end

p penultimate_fe('last word good') == 'word'
p penultimate_fe('him') == 'him'
p penultimate_fe('Launch School is great!') == 'School is'
p penultimate_fe('') == ''
p penultimate_fe('      ') == ''
p penultimate_fe(4) == nil


