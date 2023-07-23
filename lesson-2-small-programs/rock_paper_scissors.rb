VALID_CHOICES = ['rock', 'paper', 'scissors']
RESPECTIVE_COUNTERS = ['paper', 'scissors', 'rock']

def prompt(message)
  puts "=> #{message}"
end

loop do
  choice = nil
  computer_choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    computer_choice = VALID_CHOICES.sample
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice, try again.")
  end

  prompt("You chose #{choice}, the computer chose #{computer_choice}")
  choice_index = VALID_CHOICES.index(choice)
  if computer_choice == RESPECTIVE_COUNTERS[choice_index]
    prompt("You lost!")
  elsif choice == computer_choice
    prompt("You draw!")
  else
    prompt("You win!")
  end

  prompt("Wanna play again? (Y or N)")
  play_again = gets.chomp.downcase
  break unless play_again == 'y'
  prompt("Thanks for playing!")
end
