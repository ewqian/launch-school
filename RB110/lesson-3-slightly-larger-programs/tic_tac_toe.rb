require 'pry'

# Tic Tac Toe

# Pseudocode:
## 1. Display an empty 3x3 board
## 2. Ask the user to mark a square
## 3. Computer marks a square
## 4. Display the updated board state
## 5. If winner, display the winner
## 6. If board is full, display a tie
## 7. If neither winner nor tie, go to step 2
## 8. Ask if the user wants to play again
## 9. If yes go to step 1
## 10. Goodbye

INIT_STATE = ' '
PLAYER_CHOICE = 'X'
COMPUTER_CHOICE = 'O'

def display_board(hash)
  system "clear"
  puts "Your marker: #{PLAYER_CHOICE} / Computer marker: #{COMPUTER_CHOICE}"
  puts
  puts " #{hash[1]} | #{hash[2]} | #{hash[3]} "
  puts "---+---+---"
  puts " #{hash[4]} | #{hash[5]} | #{hash[6]} "
  puts "---+---+---"
  puts " #{hash[7]} | #{hash[8]} | #{hash[9]} "
  puts
end

def initialize_board
  (1..9).each_with_object({}) { |num, hash| hash[num] = INIT_STATE }
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INIT_STATE }
end

def prompt(str)
  puts "=> #{str}"
end

def joinor(arr, delim = ', ', join_word = 'or')
  if arr.size > 2
    arr[0..-2].join(delim) + "#{delim + join_word} #{arr[-1]}"
  else
    arr.size == 2 ? "#{arr[0]} #{join_word} #{arr[-1]}" : "#{arr[0]}"
  end
end

def place_piece!(brd, curr_player)
  player_move!(brd) if curr_player == "Player"
  computer_move!(brd) if curr_player == "Computer"
end

def alternate_player(curr_player)
  curr_player == "Computer" ? "Player" : "Computer"
end

def player_move!(brd)
  choice = ''

  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd), ', ', "or")})"
    choice = gets.chomp.to_i
    break if empty_squares(brd).include?(choice)
    prompt "That's not a valid choice, try again."
  end

  brd[choice] = PLAYER_CHOICE
end

def find_best_square(brd)
  square = nil
  checks_arr = [(1..3).to_a, (4..6).to_a, (7..9).to_a, # rows
                (1..7).step(3).to_a, (2..8).step(3).to_a, (3..9).step(3).to_a, # columns
                (1..9).step(4).to_a, (3..7).step(2).to_a] # diagnols

  checks_arr.each do |subarr|
    if subarr.count { |num| brd[num] == COMPUTER_CHOICE } == 2 && subarr.count { |num| brd[num] == INIT_STATE } == 1 # offense
      square = subarr.select { |num| brd[num] == INIT_STATE }[0]
      break
    elsif subarr.count { |num| brd[num] == PLAYER_CHOICE } == 2 && subarr.count { |num| brd[num] == INIT_STATE } == 1 # defense
      square = subarr.select { |num| brd[num] == INIT_STATE }[0]
      break
    end
  end

  square = 5 if square == nil && brd[5] == INIT_STATE
  square
end

def computer_move!(brd)
  choice = find_best_square(brd)
  choice = empty_squares(brd).sample if choice == nil
  brd[choice] = COMPUTER_CHOICE
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def winner(brd)
  who_won = nil
  checks_arr = [(1..3).to_a, (4..6).to_a, (7..9).to_a, # rows
                (1..7).step(3).to_a, (2..8).step(3).to_a, (3..9).step(3).to_a, # columns
                (1..9).step(4).to_a, (3..7).step(2).to_a] # diagnols

  checks_arr.each do |subarr|
    if subarr.all? { |num| brd[num] == PLAYER_CHOICE }
      who_won = "Player"
      break
    elsif subarr.all? { |num| brd[num] == COMPUTER_CHOICE }
      who_won = "Computer"
      break
    end
  end

  who_won
end

def someone_won?(brd)
  !!(winner(brd))
end

player_score = 0
computer_score = 0

loop do
  board = initialize_board()
  prompt "Who should pick who goes first? (Player/Computer)"
  pick_input = gets.chomp

  if pick_input.downcase.start_with?('p')
    prompt "Who should have the first move? (Player/Computer)"
    player_input = gets.chomp
    first_move_player = (player_input.downcase.start_with?('p') ? true : false)
  else
    first_move_player = [true, false].sample
  end

  current_player = first_move_player ? "Player" : "Computer"

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    victor = winner(board)
    player_score += 1 if victor == 'Player'
    computer_score += 1 if victor == 'Computer'
    prompt "#{victor} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Current Score: Player - #{player_score} / Computer - #{computer_score}"
  break prompt "#{victor} won 5 games first & is the grand winner!" if player_score == 5 || computer_score == 5
  prompt "Play again? (y or n)"
  play_again = gets.chomp
  break prompt "Thanks for playing!" unless play_again.downcase.start_with?("y")
end
