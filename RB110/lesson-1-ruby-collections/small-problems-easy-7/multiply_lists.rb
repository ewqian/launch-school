def multiply_list(arr1, arr2)
  arrz = arr1.zip(arr2)
  arrz.map { |sub_arr| sub_arr.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]