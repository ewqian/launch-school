def transpose(matrix)
  transposed_arr =  [[], [], []]

  matrix.each do |subarr|
    subarr.each_with_index { |val, idx| transposed_arr[idx] << val }
  end

  transposed_arr
end

def transpose!(matrix)
  og_copy = matrix.map(&:clone)

  (0..2).each do |row_idx|
    (0..2).each do |col_idx|
      matrix[row_idx][col_idx] = og_copy[col_idx][row_idx]
    end
  end

  matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose!(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]