# The issue is line 28 `guess_number(max_number, max_attempts)`
# This causes the method to run a brand new instance which leads to the winning number to constantly change
# To fix this remove line 28 as our loop already handles the user trying again

# Fixed code
def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break puts "You're out of trys. Better luck next time :(" if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number

      # Try again:
      #guess_number(max_number, max_attempts)
    end
  end
end

guess_number(10, 3)