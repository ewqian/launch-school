def star(n) # n is an odd integer && n >= 7
  num_iterations = n / 2
  outer_space = 0
  inner_space = (n - 3) / 2

  (1..num_iterations).each do |i|
    puts "#{' ' * outer_space}*#{' ' * inner_space}*#{' ' * inner_space}*#{' ' * outer_space}"
    outer_space += 1 unless i == num_iterations
    inner_space -= 1 unless i == num_iterations
  end

  puts "#{'*' * n}"

  (n/2).times do
    puts "#{' ' * outer_space}*#{' ' * inner_space}*#{' ' * inner_space}*#{' ' * outer_space}"
    outer_space -= 1
    inner_space += 1
  end
end

star(15)