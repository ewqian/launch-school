#puts "the value of 40 + 2 is " + (40 + 2)
# We're trying to add a string and a integer, hence we're getting a TypeError

# Fix 1
puts "the value of 40 + 2 is #{40 + 2}"
# Fix 2
puts "the value of 40 + 2 is " + (40 + 2).to_s