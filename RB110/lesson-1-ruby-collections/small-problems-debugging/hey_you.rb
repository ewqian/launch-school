# Original code
def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

## The chars method creates a new array of characters
## Those characters aren't references to the characters of the name parameter variable

# Fixed code
def shout_out_to(name)
  # name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name.upcase
end

shout_out_to('you') # expected: 'HEY YOU'