class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(home2)
    price <=> home2.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

# Further Exploration
# The technique employed here is not necessarily a good one. Not everyone would think that the
# comparison of houses should be solely based on their price. You might run into potential issues
# with people misusing the comparison operator based on their assumption of what is being compared
# which could lead to unexpected behavior. Including Comparable is a good idea when there is only
# a single, intuitive characteristic for which objects of that class are compared.