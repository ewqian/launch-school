def sum_square_difference(n)
  (1..n).inject(&:+)**2 - (1..n).map { |val| val**2 }.inject(&:+)
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150