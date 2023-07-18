def teddys_age
  puts "Teddy is #{rand(20..200)} years old!"
end

def someones_age
  print "Whose age would you like to know? "
  name = gets.chomp
  name = "Teddy" if name.empty?

  puts "#{name} is #{rand(20..200)} years old!"
end

someones_age