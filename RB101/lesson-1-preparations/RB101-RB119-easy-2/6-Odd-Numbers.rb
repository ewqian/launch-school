# method 1 - using a for loop, range & .odd?
for i in (1..99) do
  puts i if i.odd?
end

# method 2 - using .upto
1.upto(99) { |i| puts i if i % 2 == 1 }