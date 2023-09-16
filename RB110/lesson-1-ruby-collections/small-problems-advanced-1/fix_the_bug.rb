# A proper condition for the elsif conditional was missing
# This causes the program to use lines 10-12 (`array.map do ... end`) as a condition
# The map method returns a new array which is a truthy value
# Since it's truthy the program will execute the rest of the elsif block which is empty
# Hence nil is returned everytime the passed-in array isn't empty
# To fix this add the proper conditional ('array.size >= 2') so that the conditional statement works as expected

def my_method(array)
  if array.empty?
    []
  elsif array.size >= 2
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])