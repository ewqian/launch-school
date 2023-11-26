# Question 1

# 1. this is a boolean object
# 2. this is a string object
# 3. this is an array object
# 4. this is an integer object

# You can find their class via calling the #class method on each object


# Question 2

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

toyota = Car.new
ford = Truck.new
#puts toyota.go_fast
#puts ford.go_fast


# Question 3

# This is done by interpolating self.class
# In this scope self refers to the current object that called the go_fast method
# Method chaining class to it returns the class of small_car which is Car


# Question 4

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

bobthecat = AngryCat.new


# Question 5

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

pepperoni_pizza = Pizza.new('Pepperoni')
mango = Fruit.new('Mango')
#p pepperoni_pizza.instance_variables
#p mango.instance_variables

# Only class Pizza will create an object with an instance variable
# We can see this because its initialize method sets the instance variable @name to the
  # parameter variable also called name
# This isn't true for class Fruit because the name being set is interpreted as a local variable


# Question 6

# The default return value of to_s prints the object's class and an encoding of the object id
# Check Ruby documentation to be sure


# Question 7

# self refers to the calling object


# Question 8

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# self refers to the class in this context


# Question 9

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

louis_bag = Bag.new('Blue', 'Leather')
#p louis_bag
