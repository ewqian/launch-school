class Element
  attr_accessor :next
  attr_reader :datum

  def initialize(datum, next_ele=nil)
    @datum = datum
    @next = next_ele
  end

  def tail?
    self.next.nil?
  end
end

class SimpleLinkedList
  def initialize
    @list = []
  end

  def size
    list.size
  end

  def empty?
    list.empty?
  end

  def push(datum)
    list << Element.new(datum)
    list.last.next = list[-2] if list.size > 1
  end

  def pop
    popped_ele = list.pop
    popped_ele.datum
  end

  def peek
    list.empty? ? nil : list[-1].datum
  end

  def head
    list.empty? ? nil : list[-1]
  end

  def self.from_a(arr) 
    return SimpleLinkedList.new if arr.nil?
    arr.reverse.each_with_object(SimpleLinkedList.new) { |ele, new_list| new_list.push(ele) }
  end

  def to_a
    list.reverse.map { |ele| ele.datum }
  end

  def reverse
    new_list = SimpleLinkedList.new
    -1.downto(-list.size) { |i| new_list.push(list[i].datum) }
    new_list
  end

  private

  attr_accessor :list
end