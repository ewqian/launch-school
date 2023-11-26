class GuessingGame
  def initialize
    @guesses = 7
    @number = rand(1..100)
  end

  def play
    while @guesses != 0
      puts "You have #{@guesses} guesses remaining."
      print "Enter a number between 1 and 100: "
      user_input = get_valid_input()

      if correct_guess?(user_input)
        puts "You won!"
        exit
      end
      @guesses -= 1
    end

    puts "You have no more guesses. You lost!"
  end

  private

  def get_valid_input
    user_input = gets.chomp.to_i

    until (user_input >= 1) && (user_input <= 100)
      print "Invalid guess. Enter a number between 1 and 100: "
      user_input = gets.chomp.to_i
    end

    user_input
  end

  def correct_guess?(guess)
    if guess < @number
      puts "Your guess is too low."
    elsif guess > @number
      puts "Your guess is too high."
    else
      puts "That's the number!"
    end

    puts
    guess == @number
  end
end

game = GuessingGame.new
game.play
