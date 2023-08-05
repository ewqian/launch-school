def search_6
  a = []
  (1..5).each do |n|
    case n
      when 1 then puts "Enter the #{n}st number:"
      when 2 then puts "Enter the #{n}nd number:"
      when 3 then puts "Enter the #{n}rd number:"
      when 4 then puts "Enter the #{n}th number:"
      when 5 then puts "Enter the #{n}th number:"
    end
    a[n-1] = gets.chomp.to_i
  end
  
  puts "Enter the last number:"
  val = gets.chomp.to_i
  ret_str = a.include?(val) ? "The number #{val} appears in #{a}." : "The number #{val} does not appear in #{a}."
  puts ret_str
end

search_6