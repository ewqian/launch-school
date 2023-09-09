# Original code
def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

puts 'LAUNCH!'

## This isn't behaving as expected because the decrease method isn't mutating the value of counter
## Line 3 takes the inner scope parameter varaible & assigns it to a new value (at a new memory address)
## This doesn't affect the main scope variable counter whose value remains the same

# Fixed code
def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'