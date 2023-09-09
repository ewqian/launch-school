def initialize_deck
  %w(Hearts Diamonds Clubs Spades).each_with_object({}) do |suit, hash|
    values_arr = (2..10).to_a + %w(Jack Queen King Ace)
    hash[suit] = values_arr
  end
end

def deal_card!(deck)
  random_suit, random_value = nil

  loop do
    random_suit = deck.keys.sample
    random_value = deck[random_suit].sample
    break if deck[random_suit].include?(random_value)
  end

  deck[random_suit].delete(random_value)
end

def display_hands(phand, dhand, dturn = false)
  puts dturn ? "Dealer has: #{joinand(dhand)}" : "Dealer has: #{dhand[0]} & unknown card"
  puts "You have: #{joinand(phand)}"
end

def joinand(hand)
  hand.size == 2 ? "#{hand[0]} and #{hand[1]}" : hand[0..-2].join(', ') + ", and #{hand[-1]}"
end

def current_hand_sum(hand)
  hand = hand.map { |val| %w(Jack Queen King).include?(val) ? 10 : val }
  no_ace_sum = hand.select { |val| val != "Ace" }.sum

  hand.count("Ace").times do
    ace_index = hand.index("Ace")
    hand[ace_index] = (11 + no_ace_sum <= 21 ? 11 : 1)
    no_ace_sum += hand[ace_index]
  end

  hand.sum
end

def busted?(total)
  total > LIMIT
end

def grand_output(dhand, dtotal, phand, ptotal)
  puts "#{"=" * 10}"
  puts "Dealer has #{joinand(dhand)} - for a total of: #{dtotal}"
  puts "Player has #{joinand(phand)} - for a total of: #{ptotal}"
  puts "#{"=" * 10}"
end

def play_again?
  puts "Would you like to play again? (y or n)"
  answer = gets.chomp
  puts
  answer.downcase.start_with?('y')
end

LIMIT = 21
DEALER_LIMIT = 17
player_score = 0
dealer_score = 0

loop do
  # setup
  card_deck = initialize_deck()
  player_hand = []
  player_total = 0
  dealer_hand = []

  2.times do
    player_hand << deal_card!(card_deck)
    dealer_hand << deal_card!(card_deck)
  end
  dealer_total = current_hand_sum(dealer_hand)

  # player turn loop
  loop do
    display_hands(player_hand, dealer_hand)
    puts "Hit or Stay?"
    answer = gets.chomp
    puts

    player_hand << deal_card!(card_deck) if answer.downcase.start_with?('h')
    player_total = current_hand_sum(player_hand)
    break if answer.downcase.start_with?('s') || busted?(player_total)
  end

  if busted?(player_total)
    grand_output(dealer_hand, dealer_total, player_hand, player_total)
    puts "It's a bust & you lose."
    dealer_score += 1
    break puts if (player_score == 5) || (dealer_score == 5)
    play_again?() ? next : break
  end

  puts "You chose to stay!"
  puts "Dealer's turn now."
  puts
  display_hands(player_hand, dealer_hand, true)
  puts

  # dealer turn loop
  while dealer_total < DEALER_LIMIT
    dealer_hand << deal_card!(card_deck)
    dealer_total = current_hand_sum(dealer_hand)
    display_hands(player_hand, dealer_hand, true)
    puts
  end

  grand_output(dealer_hand, dealer_total, player_hand, player_total)
  if busted?(dealer_total)
    puts "The dealer busts, you win!"
    player_score += 1
  else
    winner = (player_total == dealer_total ? "tie" :
            (player_total > dealer_total ? "player" : "dealer"))

    if winner == "tie"
      puts "It's a tie!"
    else
      puts "The #{winner} is the winner!"
      player_score += 1 if winner == 'player'
      dealer_score += 1 if winner == 'dealer'
    end
  end

  break puts if (player_score == 5) || (dealer_score == 5)
  break unless play_again?()
end

puts "Final Score:"
puts "Player - #{player_score}"
puts "Dealer - #{dealer_score}"
puts "Thanks for playing!"