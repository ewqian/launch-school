def show_multiplicative_average(arr)
  mult = 1
  arr.each { |val| mult *= val }
  format('%.3f', mult.to_f / arr.length)
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
