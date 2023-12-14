def step(start_val, end_val, step)
  range_arr = []
  curr_val = start_val
  while curr_val <= end_val
    range_arr << curr_val
    curr_val += step
  end

  range_arr.each { |val| yield(val) }
end

step(1, 10, 3) { |value| puts "value = #{value}" }