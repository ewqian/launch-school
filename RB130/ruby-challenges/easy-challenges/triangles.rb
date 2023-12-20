class Triangle
  def initialize(side1, side2, side3)
    if side1 <= 0 || side2 <= 0 || side3 <= 0
      raise ArgumentError, "All sides must be of length > 0."
    elsif (side1 + side2 <= side3) || (side2 + side3 <= side1) || (side1 + side3 <= side2)
      raise ArgumentError, "Sum of the length of any 2 sides must be > than the length of the third."
    end

    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if (side1 == side2) && (side2 == side3)
      "equilateral"
    elsif (side1 == side2) || (side2 == side3) || (side1 == side3)
      "isosceles"
    else
      "scalene"
    end
  end

  private

  attr_reader :side1, :side2, :side3
end