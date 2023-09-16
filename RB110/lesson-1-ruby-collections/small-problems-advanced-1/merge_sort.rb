load 'merge_sorted_lists.rb'

# PSEUDOCODE
# return the array if it only contains one element
# split the array into halves & recursively call the method with each half
# return the merge of each half

def merge_sort(arr)
  return arr if arr.length == 1
  
  halfway_idx = (arr.length / 2) - 1
  l_arr = arr[0..halfway_idx]
  r_arr = arr[(halfway_idx+1)..-1]
  arr = [l_arr, r_arr]

  l_arr = merge_sort(l_arr)
  r_arr = merge_sort(r_arr)
  merge(l_arr, r_arr)
end

def merge_sort_fe(arr)
  ret_arr = arr.map { |val| [val] }

  until ret_arr.size == 1
    ret_arr << merge(ret_arr[0], ret_arr[1])
    2.times { ret_arr.shift }
  end
  
  ret_arr.flatten
end

def merge_sort_fe2(arr)
  ret_arr = arr.map { |val| [val] }
  temp_arr = []

  until ret_arr.length == 1
    upper_limit = (ret_arr.length.even? ? ret_arr.length - 2 : ret_arr.length - 3)

    (0..upper_limit).step(2) do |idx|
      temp_arr << merge(ret_arr[idx], ret_arr[idx+1])
    end
    temp_arr << ret_arr[-1] if ret_arr.length.odd?

    ret_arr = temp_arr
    temp_arr = []
  end

  ret_arr.flatten
end

p merge_sort_fe2([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort_fe2([5, 3]) == [3, 5]
p merge_sort_fe2([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort_fe2(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort_fe2([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]