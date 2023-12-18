require 'pry'

def factorial(n)
  return 1 if n == 0

  fact = Enumerator.new do |y|
    a = b = 1
    loop do
      y << a * b
      a, b = (a * b), (b + 1)
    end
  end

  fact.take(n).last
end

#puts factorial(0)
#puts factorial(1)
#puts factorial(2)
#puts factorial(3)
#puts factorial(4)
#puts factorial(5)
#puts factorial(6)
#puts factorial(7)
#puts factorial(8)
#puts factorial(9)
#puts factorial(10)

fact = Enumerator.new do |y|
  acc = 1
  n = 0

  loop do
    acc = (n == 0 ? 1 : acc * n)
    y << acc
    n += 1
  end
end

7.times do |i|
  puts "#{i}! == #{fact.next}"
end
puts "=========================="
3.times do |i|
  puts "#{i}! == #{fact.next}"
end
puts "=========================="

fact.rewind

7.times do |i|
  puts "#{i}! == #{fact.next}"
end
puts "=========================="


fact.each_with_index do |val, idx|
  puts "#{idx}! == #{val}"
  break if idx > 5
end
