require 'date'

def retirement
  print "What is your age? "
  age = gets.chomp.to_i
  print "At what age would you like to retire? "
  r_age = gets.chomp.to_i

  curr_year = Date.today.to_s[0..3]
  puts "It's #{curr_year}. You will retire in #{curr_year.to_i+(r_age-age)}"
  puts "You have only #{(r_age-age)} years of work to go!"
end

retirement