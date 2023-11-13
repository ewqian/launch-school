class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color
puts Cat.ancestors

# checks the class of the calling object 'cat1' 
  # doesn't find the method color
# then checks its superclass 'Animal'
  # finds the 'color' method here