def alphabetic_number_sort(arr)
  conv_arr = %w(zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen)
  str_arr = arr.map { |num| conv_arr[num] }
  str_arr.sort!.map { |num| conv_arr.index(num) }
end

p alphabetic_number_sort((0..19).to_a)
p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]