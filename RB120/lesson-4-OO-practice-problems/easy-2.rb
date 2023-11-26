# Question 1

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
oracle.predict_the_future
# This code creates a new Oracle object
# Then calls the predict_the_future method with oracle
# Which yields a string "You will " + one of the three string choices


# Question 2

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future
# First we create a RoadTrip object
# We then call the predict_the_future method from its parent class
# This will return a string "You will <something>"
  # Where <something> is one of the strings from RoadTrip#choices
# In this case the subclass method was selected first in the method lookup path - overriding the one
  # in the Oracle parent class


# Question 3

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# You can find where Ruby will look for a method using the ancestors method to see the lookup chain
# You can find an object's ancestors by calling the ancestors method.
# Lookup chain for Orange is Orange > Taste > Object > Kernel > BasicObject


# Question 4

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end


# Question 5

#excited_dog = "excited dog"
#@excited_dog = "excited dog"
#@@excited_dog = "excited dog"

# You can determine which is which by looking at the number of prepended @:
# excited_dog is a local variable
# @excited_dog is an instance variable
# @@excited_dog is a class variable


# Question 6

# The self.manufacturer method is a class method because its definition contains self
  # which in this context refers to the class itself
# You call the class method on the class itself (not on an instance of the class)


# Question 7

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

Cat.new('Tabby')
Cat.new('Maine Coon')
# puts Cat.cats_count
# The @@cats_count variable is a class variable that counts the total number of cats initialized
# It works by incrementing by 1 everytime a new Cat instance is initialized


# Question 8

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end


# Question 9

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# If we add a play method to the Bingo class then everytime we call the play method from
  # an instance of Bingo, it'll use the play method defined in the Bingo class
# This is because method lookup chains start from the class of the calling object


# Question 10

# Allows for dynamic programs & prevents you from rewriting as much code
# Helps to abstract problems making it easier to work with more complex problems
# OO thinking is easier to conceptualize
# Easier to manage more complex software
