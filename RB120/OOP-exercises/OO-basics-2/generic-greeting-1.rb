class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

kitty = Cat.new
kitty.class.generic_greeting
# line 10 will output "Hello! I'm a cat!"
# this is due to method chaining
  # kitty.class returns the class Cat
  # Cat.generic_greeting outputs the greeting string