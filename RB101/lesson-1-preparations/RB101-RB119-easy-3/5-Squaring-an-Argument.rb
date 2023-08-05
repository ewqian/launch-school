def multiply(n1, n2)
  n1*n2
end

def square(num)
  multiply(num, num)
end

# further exploration
def power_of_m(num, power)
  product = 1

  (1..power).each do |i|
    if i == 1 then product = multiply(1, num)
    else product = multiply(product, num) end
  end

  product
end

p power_of_m(5, 3)

# using a new method that allows you to multiply multiple numbers
def multiply_multiple(nums)
  product = 1
  nums.each { |n| product *= n }
  product
end

def power_of(num, power)
  nums = [num] * power
  multiply_multiple(nums)
end