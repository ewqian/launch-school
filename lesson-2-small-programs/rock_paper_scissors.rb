VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
RESPECTIVE_COUNTERS = [['paper', 'spock'], ['scissors', 'lizard'], ['rock', 'spock'], \
                       ['scissors', 'rock'], ['lizzard', 'paper']]

def prompt(message)
  puts "=> #{message}"
end

def full_choice(str)
  VALID_CHOICES.each { |val| return val if val.start_with?(str)}
end

def formatted_display
  VALID_CHOICES.map do |choice|
    if (VALID_CHOICES.select { |val| val.start_with?(choice[0]) }).size >= 2
      choice = "#{choice[0..1]} - " + choice
    else
     choice = "#{choice[0]} - " + choice
    end
  end
end

player_w_count = 0
computer_w_count = 0
DISPLAY_VALID_CHOICES = formatted_display()

loop do
  choice = nil
  computer_choice = nil

  loop do
    prompt("Choose one: #{DISPLAY_VALID_CHOICES.join(', ')}") # mod r - rock, ...
    choice = gets.chomp
    choice = full_choice(choice)
    p choice

    computer_choice = VALID_CHOICES.sample
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice, try again.")
  end

  prompt("You chose #{choice}, the computer chose #{computer_choice}")
  choice_index = VALID_CHOICES.index(choice)
  if RESPECTIVE_COUNTERS[choice_index].include?(computer_choice)
    prompt("You lost!")
    computer_w_count += 1
  elsif choice == computer_choice
    prompt("You draw!")
  else
    prompt("You win!")
    player_w_count += 1
  end

  if player_w_count == 3
    prompt("Congrats, you won 3 times before the computer. You're the grand winner!")
    break
  elsif computer_w_count == 3
    prompt("Sorry, the computer won 3 times before you could. The computer is the grand winner!")
    break
  end

  prompt("Wanna play again? (Y or N)")
  play_again = gets.chomp.downcase
  break unless play_again == 'y'
  prompt("Thanks for playing!")
end
