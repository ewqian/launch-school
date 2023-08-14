def multisum(num)
  mult_arr = []
  (1..num).each { |int| mult_arr << int if int % 3 == 0 || int % 5 == 0 }
  mult_arr.sum
end

#p multisum(3) == 3
#p multisum(5) == 8
#p multisum(10) == 33
#p multisum(1000) == 234168

def multisum_fe(num)
  (1..num).select { |i| i % 3 == 0 || i % 5 == 0 }.reduce { |sum, int| sum + int }
end

p multisum_fe(3) == 3
p multisum_fe(5) == 8
p multisum_fe(10) == 33
p multisum_fe(1000) == 234168