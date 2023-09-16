def merge(arr1, arr2) # assumes that arr1 & arr2 are sorted
  sorted_merged_arr = []
  iter = arr1.length + arr2.length
  a1_idx, a2_idx = 0, 0

  iter.times do
    case arr1[a1_idx] <=> arr2[a2_idx]
    when -1
      sorted_merged_arr << arr1[a1_idx]
      a1_idx += 1
    when nil
      sorted_merged_arr << arr1[a1_idx] if arr1[a1_idx] != nil
      a1_idx += 1 if !(arr1.empty?)
      sorted_merged_arr << arr2[a2_idx] if arr2[a2_idx] != nil
      a2_idx += 1 if !(arr2.empty?)
    else # when 0 or 1
      sorted_merged_arr << arr2[a2_idx]
      a2_idx += 1
    end
  end

  sorted_merged_arr
end

if __FILE__ == $0
  p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
  p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
  p merge([], [1, 4, 5]) == [1, 4, 5]
  p merge([1, 4, 5], []) == [1, 4, 5]
end