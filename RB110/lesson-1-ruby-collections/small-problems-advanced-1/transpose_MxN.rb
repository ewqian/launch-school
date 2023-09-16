def transpose(matrix)
  matrix_cols = matrix[0].size
  transposed_arr =  Array.new(matrix_cols) { |val| [] }

  matrix.each do |subarr|
    subarr.each_with_index { |val, idx| transposed_arr[idx] << val }
  end

  transposed_arr
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]