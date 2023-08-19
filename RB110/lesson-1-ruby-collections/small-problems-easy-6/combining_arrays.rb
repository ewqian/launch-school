def merge(arr1, arr2)
  arr1.union(arr2)
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

def merge_fe(arr1, arr2)
  ret_arr = []
  full_arr = arr1 + arr2
  full_arr.each { |val| ret_arr << val if !(ret_arr.include?(val)) }
  ret_arr.sort
end

p merge_fe([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]