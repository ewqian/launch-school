class Participant
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def busted?(total=nil)
    return total() > 21 if total.nil?
    total > 21
  end

  def total
    num_hand = hand.map do |card|
      if %w(J Q K).include?(card.value)
        10
      elsif card.value == 'A'
        'A'
      else
        card.value.to_i
      end
    end

    num_hand.include?('A') ? sum_with_ace(num_hand) : num_hand.sum
  end

  def sum_with_ace(ace_hand)
    sum = ace_hand.select { |val| val != 'A' }.sum
    num_aces = ace_hand.count('A')
    soft11 = false

    num_aces.times do
      if sum + 11 > 21
        sum += 1
      else
        sum += 11
        soft11 = true
      end
    end

    sum > 21 && soft11 ? sum - 10 : sum
  end

  def display_hand(init_hand: false)
    output_card_border(true)

    if init_hand && instance_of?(Dealer)
      print " |  ?  | "
      extra_char = hand[1].value.length == 2 ? '' : ' '
      print " |  #{hand[1].value}#{extra_char} | "
    else
      hand.each do |card|
        extra_char = card.value.length == 2 ? '' : ' '
        print " |  #{card.value}#{extra_char} | "
      end
    end

    output_card_border(false)
    ""
  end

  def output_card_border(upper)
    num = hand.size
    if upper
      num.times { print " ┌─────┐ " }
      puts
      num.times { print " |     | " }
    else
      puts
      num.times { print " |     | " }
      puts
      num.times { print " └─────┘ " }
    end
    puts
  end
end

class Dealer < Participant
  def deal(participant, deck)
    participant.hand << deck.cards.pop
  end
end

class Player < Participant
end

class Deck
  attr_reader :cards

  def initialize
    cards_arr = []
    4.times { Card::VALUES.each { |val| cards_arr << Card.new(val) } }
    @cards = cards_arr.shuffle
  end
end

class Card
  VALUES = %w(A 2 3 4 5 6 7 8 9 10 J Q K)

  attr_reader :value

  def initialize(value)
    @value = value
  end
end

class TwentyOne
  attr_accessor :deck, :player, :dealer

  def initialize
    self.deck = Deck.new
    self.player = Player.new
    self.dealer = Dealer.new
  end

  def play
    deal_cards()
    show_hands(init_hand: true)
    player_turn()
    player_total = player.total
    dealer_turn() if !player.busted?(player_total)
    dealer_total = dealer.total
    show_result(player_total, dealer_total)
  end

  private

  def deal_cards
    2.times { dealer.deal(player, deck) }
    2.times { dealer.deal(dealer, deck) }
  end

  def show_hands(init_hand: false)
    puts
    puts "Dealer's cards: "
    puts dealer.display_hand(init_hand: init_hand)
    puts "Your cards: "
    puts player.display_hand
  end

  def player_turn
    puts "Player's turn:"
    until player.busted?
      input = valid_player_action()
      break if input.include?('s')
      dealer.deal(player, deck)
      show_hands(init_hand: true)
    end
  end

  def valid_player_action
    loop do
      puts "Hit or Stay?"
      input = gets.chomp.downcase
      return input if input == 'hit' || input == 'stay' || \
                      input == 'h'   || input == 's'
      puts "Invalid input, try again." + "\n\n"
    end
  end

  def dealer_turn
    puts "\n" + "Dealer's turn completed."
    until dealer.busted? || dealer.total >= 17
      dealer.deal(dealer, deck)
    end
    show_hands()
  end

  def show_result(player_total, dealer_total)
    if player.busted?(player_total)
      puts "Player has busted, Dealer wins!"
    elsif dealer.busted?(dealer_total)
      puts "Dealer has busted, Player wins!"
    else
      puts "Player's total: #{player_total} | Dealer's total: #{dealer_total}"
      puts "Player wins!" if (player_total <=> dealer_total) == 1
      puts "Dealer wins!" if (player_total <=> dealer_total) == -1
      puts "It's a tie!"  if (player_total <=> dealer_total) == 0
    end
  end
end

TwentyOne.new.play
