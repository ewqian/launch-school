# The code raises an error due to variable scoping
# Methods have closed scope and can only access local variables from the main scope when they're explicitely passed in as arugments
# This also means we have to modify the method definition for `verify_password` to include a parameter variable

password = nil

def set_password
  puts 'What would you like your password to be?'
  gets.chomp
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)