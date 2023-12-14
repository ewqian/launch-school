def zip(arr1, arr2)
  zipped_arr = []
  arr1.each_index { |idx| zipped_arr << [arr1[idx], arr2[idx]] }
  zipped_arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]