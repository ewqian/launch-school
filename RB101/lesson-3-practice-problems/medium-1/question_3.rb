def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# the purpose of 'number % divisor == 0' isto verify that the current divisor is also a factor of the number
# the purpose of line 8 is so that the method returns the factors array (since it'll return the last evaluated value).
