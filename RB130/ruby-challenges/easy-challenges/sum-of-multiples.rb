class SumOfMultiples
  def initialize(*set)
    @set = set
  end

  def to(num)
    self.class.number_multiples(set, num).uniq.sum
  end

  def self.to(num)
    number_multiples([3, 5], num).uniq.sum
  end

  private

  attr_reader :set

  def self.number_multiples(set, num)
    set.each_with_object([0]) do |n, multiples|
      (n...num).step(n) do |mult|
        multiples << mult
      end
    end
  end
end