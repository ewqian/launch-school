# Question 1

# Ben is right, he doesn't need an @ because he has a getter method defined on line 2
# Alyssa isn't necessarily wrong in that writing @balance >= 0 would also work
  # but the @ isn't required


# Question 2

class InvoiceEntry
  attr_reader :product_name
  attr_writer :quantity

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

entry1 = InvoiceEntry.new('Charmin Ultra', 2)
entry1.update_quantity(4)


# Question 3

# No major issues, one consideration is that by defining a setter method an individual can bypass
  # the update_quantity method & use the setter to directly set values. This circumvents the
  # protections built into the update_quantity method & may pose issues down the line.


# Question 4

class Greeting
  def greet(str)
    puts str
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end


# Question 5

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    type = (@filling_type.nil? ? 'Plain' : @filling_type)

    if @glazing.nil? then type
    else "#{type} with #{@glazing}" end
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")
#puts donut1
#puts donut2
#puts donut3
#puts donut4
#puts donut5


# Question 6

# There is no difference in the way the codes work
# Prefer the first option since the self is unescessary

# Question 7

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end
