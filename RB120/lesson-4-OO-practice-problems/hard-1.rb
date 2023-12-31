# Question 1

module Vehicles
  attr_accessor :speed, :heading
  attr_writer :fuel_efficiency, :fuel_capacity

  def range
    (@fuel_capacity * @fuel_efficiency).to_i
    #self.class.ancestors.include?(WheeledVehicle) ? range : (range + 10)
  end
end

class WheeledVehicle
  include Vehicles

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  include Vehicles
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  include Vehicles
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class AquaticVehicle
  include Vehicles
  attr_accessor :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    self.propeller_count = num_propellers
    self.hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def range
    super + 10
  end
end

class Catamaran < AquaticVehicle
end

class Motorboat < AquaticVehicle
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

yamaha = Motorcycle.new
aqua = Motorboat.new(80, 8)
puts yamaha.range
puts aqua.range