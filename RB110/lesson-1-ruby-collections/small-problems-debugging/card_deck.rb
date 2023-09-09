require 'pry'

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.dup,
         :diamonds => cards.dup,
         :clubs    => cards.dup,
         :spades   => cards.dup }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck
p deck
sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  current_sum = remaining_cards.map do |card|
    score(card)
  end
  
  sum += current_sum.sum
end

puts sum

## The sum is lower than it should be because we're assigning all the hash values of the deck to the same cards array
## This results in each suit of the deck hash having the same cards & when we execute lines 23-27 we're mutating & working off the same array for each iteration
## To fix this I set the values of each deck suit to `cards.dup` instead of referencing the same cards array