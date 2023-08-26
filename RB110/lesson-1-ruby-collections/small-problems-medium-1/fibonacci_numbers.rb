def fibonacci(n)
  return 1 if n == 1 || n == 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

#p fibonacci(1) == 1
#p fibonacci(2) == 1
#p fibonacci(3) == 2
#p fibonacci(4) == 3
#p fibonacci(5) == 5
#p fibonacci(12) == 144
#p fibonacci(20) == 6765

def fibonacci_procedural_og(n)
  arr = [0, 1, 1]
  (n - 2).times { arr << arr[-1] + arr[-2] }
  arr[-1]
end

def fibonacci_procedural(n)
  first, last = 1, 1
  (n - 2).times { first, last = last, (first + last) }
  last
end

#p fibonacci_procedural(20) == 6765
#p fibonacci_procedural(100) == 354224848179261915075
#p fibonacci_procedural(100_001) # => 4202692702.....8285979669707537501

def fibonacci_last(n)
  fibonacci_procedural(n).to_s[-1].to_i
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4

