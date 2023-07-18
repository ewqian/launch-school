def sum_or_product
  puts "Please enter an integer greater than 0:"
  num = gets.chomp.to_i
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  op = gets.chomp

  if op == 's'
    ret_val = 0
    (1..num).step { |i| ret_val += i }
    op = "sum"
  else
    ret_val = 1
    (1..num).step { |i| ret_val *= i }
    op = "product"
  end

  puts "The #{op} of the integers between 1 and #{num} is #{ret_val}."
end

def sum_or_product_inject
  puts "Please enter an integer greater than 0:"
  num = gets.chomp.to_i
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  op = gets.chomp

  if op == 's'
    ret_val = (1..num).inject(:+)
    op = "sum"
  else
    ret_val = (1..num).inject(:*)
    op = "product"
  end

  puts "The #{op} of the integers between 1 and #{num} is #{ret_val}."
end 

sum_or_product_inject