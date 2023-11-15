class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
    return 2 if self.class == Motorcycle
    return 4 if self.class == Car
    return 6 if self.class == Truck
  end
end

class Car < Vehicle
  #def wheels
  #  4
  #end
end

class Motorcycle < Vehicle
  #def wheels
  #  2
  #end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  #def wheels
  #  6
  #end
end

prius = Car.new('Toyota', 'Prius')
desertx = Motorcycle.new('Ducati', 'DesertX')
f150 = Truck.new('Ford', 'F150', '9000 lbs')
puts prius, desertx, f150
puts prius.wheels, desertx.wheels, f150.wheels

# Further Exploration
# It'd make sense to include wheels within the superclass Vehicle if by the definition of vehicle
# all vehicles have wheels. If a boat is considered a Vehicle then this wouldn't make sense because
# boats don't typically have wheels. Nonetheless I've demonstrated how to include wheels in Vehicle.