class CustomSet
  def initialize(arr=[])
    @set = arr
  end

  def empty?
    set.empty?
  end

  def contains?(val)
    set.include?(val)
  end

  def subset?(other)
    set.empty? || set.sort == other.set.sort[0..(set.size - 1)]
  end

  def disjoint?(other)
    set.all? { |num| !other.set.include?(num) }
  end

  def eql?(other)
    set.uniq.sort == other.set.uniq.sort
  end
  alias :== :eql?

  def add(num)
    set << num unless set.include?(num)
    self
  end

  def intersection(other)
    set.each_with_object(CustomSet.new) do |num, in_set|
      in_set.add(num) if other.set.include?(num)
    end
  end

  def difference(other)
    diff_set = set.select { |num| !other.set.include?(num) }
    CustomSet.new(diff_set)
  end

  def union(other)
    union_set = (set + other.set).uniq
    CustomSet.new(union_set)
  end

  protected

  attr_reader :set
end