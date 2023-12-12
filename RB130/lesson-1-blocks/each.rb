class Array
  def each
    self.length.times { |idx| yield(self[idx]) }
    self
  end
end
  

p [1, 2, 3].each { |num| "do nothing" }                           # still returns [1, 2, 3]
p [1, 2, 3].each{|num| "do nothing"}.select{ |num| num.odd? }     # => [1, 3]
p [1, 2, 3].each { |num| puts num }