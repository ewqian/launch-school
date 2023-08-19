def interleave_mutating(arr1, arr2)
  (0..(arr1.length + arr2.length - 1)).each_with_object([]) { |idx, ret_arr| ret_arr << (idx.even? ? arr1.shift : arr2.shift) }
end

def interleave(arr1, arr2)
  (0..arr1.length-1).each_with_object([]) { |idx, arr| arr << arr1[idx] << arr2[idx] }
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']