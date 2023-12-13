def missing(arr)
  ret_arr = []
  (arr.first..arr.last).each do |int|
    ret_arr << int if !arr.include?(int)
  end

  ret_arr
end

# further exploration - without using a method that requires a block
def missing_fe(arr)
  (arr.first..arr.last).to_a - arr
end

p missing_fe([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing_fe([1, 2, 3, 4]) == []
p missing_fe([1, 5]) == [2, 3, 4]
p missing_fe([6]) == []