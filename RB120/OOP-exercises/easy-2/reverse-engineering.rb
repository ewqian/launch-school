class Transform
  attr_reader :string

  def initialize(str)
    @string = str
  end

  def uppercase
    string.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts my_data.string
puts Transform.lowercase('XYZ')