def room_area
  puts "Enter the length of the room in meters:"
  length = gets.chomp.to_f
  puts "Enter the width of the room in meters:"
  width = gets.chomp.to_f

  puts "The area of the room is #{length*width} square meters (#{(length*width*10.7639).round(2)} square feet)."
end

def room_area_feet
  puts "Enter the length of the room in feet:"
  length = gets.chomp.to_f
  puts "Enter the width of the room in feet:"
  width = gets.chomp.to_f

  puts "The area of the room is..." + \
       "#{length*width} square feet, #{((length*width)*144).round(2)} square inches, & #{((length*width)*144*6.4516).round(2)} square centimeters."
end

room_area_feet