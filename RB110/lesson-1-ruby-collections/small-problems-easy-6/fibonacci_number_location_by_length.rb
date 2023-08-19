def find_fibonacci_index_by_length(int)
  arr = [0, 1]
  idx = 2
  
  loop do
    arr << arr[idx - 1] + arr[idx - 2]
    break if arr[idx].to_s.length == int
    idx += 1
  end

  idx
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847