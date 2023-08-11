# Recursive helper method to find the first value of the row
def find_first_val(n)
  return 2 if n == 1
  2*(n-1) + find_first_val(n-1)
end

# Method that utilizes find_first_val to find the sum of the row
def rec_row_sum(n)
  first_val = find_first_val(n)
  row_arr = [first_val]
  
  (n-1).times do
    first_val += 2
    row_arr << first_val
  end

  row_arr.sum
end

# Method to sum the even integers in a row
def row_sum(n)
  arr = []
  curr_num = 2

  for i in (1..n)
    arr << []
    i.times do |idx|
      arr[i-1] << curr_num
      curr_num += 2
    end
  end

  arr.last.sum
end

p row_sum(4)
p rec_row_sum(4)