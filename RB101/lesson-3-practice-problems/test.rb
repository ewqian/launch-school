require 'pry'

def print_in_box(str)
  puts "+#{'-' * (str.length + 2)}+"
  puts "| #{' ' * str.length} |"
  puts "| #{str} |"
  puts "| #{' ' * str.length} |"
  puts "+#{'-' * (str.length + 2)}+"
end

def print_and_wrap_message(str)
  puts "+#{'-' * 78}+"
  puts "| #{' ' * 76} |"

  str_arr = []
  while !(str.empty?)
    if str.size >= 76
      str_arr << str.slice!(0..75)
    else
      str_arr << str.slice!(0..(str.size - 1))
    end
  end
  
  str_arr.each do |string|
    white_space = 76 - string.length
    if string.start_with?(' ')
      string.strip!
      string << ' '
    end
    puts "| #{string}#{' ' * white_space} |"
  end

  puts "| #{' ' * 76} |"
  puts "+#{'-' * 78}+"
end

print_and_wrap_message("To boldly go where no one has gone before. Again, remember to remove or comment out the binding.pry and require 'pry' when you're done debugging your code to prevent pausing every time it reaches that point and to keep your code clean for production use.")