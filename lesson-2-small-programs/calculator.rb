require 'yaml'
MESSAGES = YAML.load_file('calc_messages.yml')
LANGUAGE = 'fr'

# puts MESSAGES.inspect

def prompt(message)
  message = MESSAGES[LANGUAGE][message]
  puts "=> #{message}"
end

def valid_number?(str)
  str.match?(/\A-?\d+(\.\d+)?\z/)
end

def op_to_msg(str)
  word =  case str
            when 1
              "Adding"
            when 2
              "Subtracting"
            when 3
              "Multiplying"
            when 4
              "Dividing"
          end

  # If we wanted to add code here we need to make sure that we're still returning the result of the case statement. 
  # So we need to save the return value of the case statement into a variable.
  # Then we should return that variable at the end of this method.

  return word
end

prompt('greeting')
name = nil
loop do
  name = gets.chomp
  break if !name.empty?
  prompt('valid_name')
end

puts("Hi #{name}!")

loop do # main loop
  n1 = nil
  n2 = nil

  loop do
    prompt('get_num1')
    n1 = gets.chomp

    if valid_number?(n1)
      n1 = n1.to_i
      break
    end
    prompt('nonvalid_num')
  end

  loop do
    prompt('get_num2')
    n2 = gets.chomp

    if valid_number?(n2)
      n2 = n2.to_i
      break
    end
    prompt('nonvalid_num')
  end

  op_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  puts(op_prompt)
  op = nil

  loop do
    op = gets.chomp.to_i
    break if [1,2,3,4].include?(op)
    prompt('nonvalid_op')
  end

  puts("#{op_to_msg(op)} the two numbers...")

  result = case op
            when 1
              n1.to_f + n2.to_f
            when 2
              n1.to_f - n2.to_f
            when 3
              n1.to_f * n2.to_f
            when 4
              n1.to_f / n2.to_f
  end

  puts("The result is: #{result}")
  prompt('another_op?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('closing')