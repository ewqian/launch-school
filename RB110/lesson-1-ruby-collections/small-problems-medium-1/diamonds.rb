def diamond(n)
  (1..n).each do |int|
    stars = (int <= (n/2.0).ceil) ? (2*int - 1) : (n - (int - (n/2.0).ceil)*2)
    spaces = (n - stars)/2
    puts "#{' ' * spaces}#{'*' * stars}#{' ' * spaces}"
  end
end

diamond(5)
    