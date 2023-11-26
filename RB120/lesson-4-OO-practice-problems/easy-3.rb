# Question 1

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
#hello.hi
# this will output 'Hello'

hello = Hello.new
#hello.bye
# no method error

hello = Hello.new
#hello.greet
# argument error, expected 1 given 0

hello = Hello.new
#hello.greet("Goodbye")
# this will output 'Goodbye'

#Hello.hi
# undefined method error
# there is no class method called hi only an instance method


# Question 2

class Greeting
  def self.greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

#Hello.hi


# Question 3

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

john = AngryCat.new(14, 'John')
bob = AngryCat.new(8, 'Bob')


# Question 4

class Cat
  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{@type} cat"
  end
end

#puts Cat.new('tabby')


# Question 5

# line 1 creates a new instance of the Television class
# line 2 would yield a no method error since manufacturer is a class method & we're calling it
  # with an instance of the class
# line 3 would yield the model of the of the tv
# line 5 would yield the manufacturer of the tv
# line 6 would yield a no method error since model is an isntance method being called with the class


# Question 6

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end


# Question 7

# unecessary code removed:
class Light
  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    "I want to turn on the light with a brightness level of super high and a color of green"
  end

end