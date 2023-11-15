class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    name = @name.clone
    name.upcase!
    "My name is #{@name}."
  end
end

#name = 'Fluffy'
#fluffy = Pet.new(name)
#puts fluffy.name # originally outputed: Fluffy
#puts fluffy # originally outputed: My name is FLUFFY.
#puts fluffy.name # originally outputed: FLUFFY
#puts name # originally outputed: FLUFFY

# Questions
# 1. Why doesn't the :to_s method on line 5 call the one on line 8
# 2. Use pry to step through the further exploration exercise

# Further Exploration
name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name