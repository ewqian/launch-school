class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, colors)
    super(name, age)
    @colors = colors
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@colors} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Further Exploration
# We wouldn't need to supply an initialize method because the program will just search the method
# lookup path & the initialize method for class Pet would be used.

# It'd be ok to do this if we were sure the initial instance variables are the same for every
# children class under Pet. If there are problems that arise for a specific subclass then you'd need
# to create that class its own initialize method.