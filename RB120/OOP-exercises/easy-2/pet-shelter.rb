class Pet
  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end

  def to_s
    "a #{animal} named #{name}"
  end
end

class Owner
  attr_reader :name
  attr_accessor :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def adopt_pet(pet)
    pets << pet
  end

  def number_of_pets
    pets.size
  end
end

class Shelter
  attr_reader :adoptions, :unadopted

  def initialize
    @adoptions = Hash.new
    @unadopted = []
  end

  def adopt(owner, pet)
    owner.adopt_pet(pet)
    adoptions[owner.name] = owner if !(adoptions.key?(owner.name))
  end

  def print_adoptions
    adoptions.each do |k, v|
      puts "#{k} has adopted the following pets:"
      v.pets.each { |pet| puts pet }
      puts
    end
  end

  def intake(pet)
    unadopted << pet
  end

  def print_unadopted
    puts "The Animal Shelter has the following unadopted pets:"
    unadopted.each { |pet| puts pet }
    puts
  end
end

# adopted pets
butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
# unadopted pets
asta = Pet.new('dog', 'Asta')
laddie = Pet.new('dog', 'Laddie')
fluffy = Pet.new('cat', 'Fluffy')
chatterbox = Pet.new('parakeet', 'Chatterbox')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.intake(asta)
shelter.intake(laddie)
shelter.intake(fluffy)
shelter.intake(chatterbox)
shelter.print_unadopted
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."