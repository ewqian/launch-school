class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

# OG SOLUTION
#module RankConverter
#  def rank_num_to_str
#    case self.rank
#    when 11
#      self.rank = 'Jack'
#    when 12
#      self.rank = 'Queen'
#    when 13
#      self.rank = 'King'
#    when 14
#      self.rank = 'Ace'
#    end
#
#    self
#  end
#
#  private
#
#  def rank_str_to_num(card_arr)
#    card_arr.each do |card|
#      if card.rank.is_a?(String) # the rank is a string
#        case card.rank
#        when 'Jack'
#          card.rank = 11
#        when 'Queen'
#          card.rank = 12
#        when 'King'
#          card.rank = 13
#        when 'Ace'
#          card.rank = 14
#        end
#      end
#    end
#
#    card_arr
#  end
#end
#
#
#class Array
#  include RankConverter
#
#  def min
#    num_arr = rank_str_to_num(self)
#    min_card = super { |card| card.rank }
#    min_card.rank_num_to_str
#  end
#
#  def max
#    num_arr = rank_str_to_num(self)
#    max_card = super { |card| card.rank }
#    max_card.rank_num_to_str
#  end
#end
#
#class Card
#  include RankConverter
#  attr_reader :rank, :suit
#  attr_writer :rank
#
#  def initialize(rank, suit)
#    @rank = rank
#    @suit = suit
#  end
#
#  def to_s
#    "#{rank} of #{suit}"
#  end
#
#  def ==(object2)
#    (self.rank == object2.rank) && (self.suit == object2.suit)
#  end
#end

cards = [Card.new(2, 'Hearts'),
  Card.new(10, 'Diamonds'),
  Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
  Card.new(4, 'Diamonds'),
  Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
  Card.new('Jack', 'Diamonds'),
  Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
  Card.new(8, 'Clubs'),
  Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8