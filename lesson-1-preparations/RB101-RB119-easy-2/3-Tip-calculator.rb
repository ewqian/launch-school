def tip_calculator
  print "What is the bill? "
  bill = gets.chomp.to_f
  print "What is the tip percentage? "
  tip_p = gets.chomp.to_f

  tip = bill*tip_p*0.01
  puts ""
  puts "The tip is $#{sprintf('%.2f', (tip).round(2))}"
  puts "The total is $#{sprintf('%.2f', (bill+tip).round(2))}"
end

tip_calculator