array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# This will output the elements of the array: ["Moe", "Larry", "CURLY", "SHEMP" "Harpo", "CHICO", "Groucho", "Zeppo"]
# The `<<` method appends a reference to the original object to `array2` and not a copy
# Therefore when `array1`'s elements are mutated, so are `array2`'s