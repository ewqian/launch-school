# TEXTUAL DESCRIPTION OF ROCK PAPER SCISSORS
# Rock Paper Scissors is a 2 person game where both players are
# required to make a choice from three options: Rock, Paper or Scissors.
# Choices are made independetly without any knowledge of what the
# other person selected. A winner is determined by comparing choices,
# here's how each choice fares against the other.

# - Rock beats Scissors
# - Scissors beats Paper
# - Paper beats Rock

# If players select the same choice then it's a tie.

# MAJOR NOUNS & VERBS
# Nouns - Player, Move (Rock, Paper, Scissors), Rule
# Verbs - Choose, Compare

# ORGANIZING VERBS W/ NOUNS
# Player
#   Choose
# Move
# Rule
# TBD
#   Compare

class Move
  include Comparable

  VALUES = %w(Rock Paper Scissors)
  BEATS = { 'Rock' => 'Scissors', 'Scissors' => 'Paper', 'Paper' => 'Rock' }

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def <=>(other)
    if value == other.value
      0
    elsif BEATS[value] == other.value
      1
    else # computer's choice beats humans choice
      -1
    end
  end
end

class Player
  attr_accessor :choice, :score
  attr_reader :human

  def initialize
    @score = 0
  end
end

class Human < Player
  def choose
    self.choice = valid_choice()
  end

  private

  def valid_choice
    loop do
      puts "Please choose: Rock, Paper or Scissors"
      player_choice = gets.chomp.capitalize
      return Move.new(player_choice) if Move::VALUES.include?(player_choice)
      puts "Sorry that's not a valid choice, please try again."
    end
  end
end

class Computer < Player
  def choose
    self.choice = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message(human, computer)
    puts
    puts "Final Score: Human - #{human.score} & Computer - #{computer.score}"

    if human.score == computer.score then puts "It's a tie!"
    elsif human.score > computer.score then puts "You win!"
    else puts "Computer wins!" end

    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_winner(human, computer)
    puts
    print "You chose #{human.choice.value} " \
          "& the computer chose #{computer.choice.value} - "

    if human.choice > computer.choice
      human.score += 1
      puts "You won!"
    elsif human.choice < computer.choice
      computer.score += 1
      puts "The computer won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if %w(y n).include?(answer.downcase)
      puts "Invalid input, must be y or n."
    end
    puts
    answer == 'y'
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_winner(human, computer)
      break if human.score == 2 || computer.score == 2
      break unless play_again?()
    end

    display_goodbye_message(human, computer)
  end
end

RPSGame.new.play
