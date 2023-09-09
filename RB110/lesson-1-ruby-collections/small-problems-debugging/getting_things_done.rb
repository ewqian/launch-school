## Line 11 results in a SystemStackError because calling the method move results in an infinite loop
## This error means that we've run out of space on the call stack
## To fix this we should add a base case to the method `move` that allows us to return from the method

# Fixed code
def move(n, from_array, to_array)
  return if n == 0 
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']