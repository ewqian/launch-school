class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    parse_full_name(name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    parse_full_name(name)
  end

  def same_name?(person2)
    self.name == person2.name
  end

  def to_s
    name
  end

  private

  def parse_full_name(name)
    self.first_name = name.split[0]
    self.last_name = (name.split[1] == nil ? '' : name.split[1])
  end
end

# 1
#bob = Person.new('bob')
#bob.name                  # => 'bob'
#bob.name = 'Robert'
#bob.name                  # => 'Robert'

# 2
#bob = Person.new('Robert')
#bob.name                  # => 'Robert'
#bob.first_name            # => 'Robert'
#bob.last_name             # => ''
#bob.last_name = 'Smith'
#bob.name                  # => 'Robert Smith'

# 3
#bob = Person.new('Robert')
#bob.name                  # => 'Robert'
#bob.first_name            # => 'Robert'
#bob.last_name             # => ''
#bob.last_name = 'Smith'
#bob.name                  # => 'Robert Smith'
#
#bob.name = "John Adams"
#bob.first_name            # => 'John'
#bob.last_name             # => 'Adams'

# 4
#bob = Person.new('Robert Smith')
#rob = Person.new('Robert Smith')
#puts bob.same_name?(rob)

# 5
bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}" 
# Line 65 will output the string representation of the person object in memory if no custom
# to_s method is defined.
