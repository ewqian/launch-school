class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                   [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                   [1, 5, 9], [3, 5, 7]]            # diagonals

  attr_accessor :grid

  def initialize
    grid_arr = Array.new(9)
    @grid = grid_arr.each_index { |idx| grid_arr[idx] = Square.new }
  end

  def []=(index, new_value)
    grid[index - 1].value = new_value
  end

  def empty_squares
    empty_arr = []
    grid.each_index { |idx| empty_arr << (idx + 1) if grid[idx].value.nil? }
    empty_arr
  end

  def full?
    grid.all? { |square| !(square.value.nil?) }
  end

  def winner
    WINNING_LINES.each do |idx_set|
      adj_idxs = idx_set.map { |val| val - 1 }
      squares_arr = grid.values_at(*adj_idxs)
      return squares_arr[0].value if squares_arr.map(&:value).uniq.count == 1
    end

    nil
  end

  def immediate_action
    marker_arr = [TTTGame::COMPUTER_MARKER, TTTGame::get_human_marker]
    adj_idxs = WINNING_LINES.map { |indices| indices.map { |val| val - 1 } }
    values_arr = adj_idxs.map do |idx_set|
      grid.values_at(*idx_set).map(&:value)
    end

    marker_arr.each do |marker|
      values_arr.each_with_index do |val_set, idx|
        if val_set.count(marker) == 2 && val_set.count(nil) == 1
          nil_idx = val_set.index(nil)
          return (adj_idxs[idx][nil_idx] + 1)
        end
      end
    end

    nil
  end

  def joinor(arr, delim1=', ', delim2='or')
    if arr.size > 2
      arr[0..-2].join(delim1) + delim1 + delim2 + ' ' + arr[-1].to_s
    elsif arr.size == 2
      arr[0].to_s + " #{delim2} " + arr[1].to_s
    else
      arr[0].to_s
    end
  end

  def display
    system('clear')
    puts "+-----------+"
    puts "| #{grid[0]} | #{grid[1]} | #{grid[2]} |"
    puts "|-----------|"
    puts "| #{grid[3]} | #{grid[4]} | #{grid[5]} |"
    puts "|-----------|"
    puts "| #{grid[6]} | #{grid[7]} | #{grid[8]} |"
    puts "+-----------+"
  end
end

class Square
  attr_accessor :value

  def initialize
    @value = nil
  end

  def to_s
    value ? @value : ' '
  end
end

class Player
  def initialize(human: true)
    @marker = human ? TTTGame::get_human_marker : TTTGame::COMPUTER_MARKER
    @human = human
  end

  def mark(board)
    if @human
      input = nil
      loop do
        puts "Select an empty square: #{board.joinor(board.empty_squares)}"
        input = gets.chomp.to_i
        break if board.empty_squares.include?(input)
        puts "Invalid input, try again."
      end
      puts
      board[input] = TTTGame::get_human_marker
    else
      selected_idx = board.immediate_action
      selected_idx = 5 if (selected_idx.nil? && board.empty_squares.include?(5))
      selected_idx = board.empty_squares.sample if selected_idx.nil?
      board[selected_idx] = TTTGame::COMPUTER_MARKER
    end
  end
end

class TTTGame
  COMPUTER_MARKER = 'O'

  attr_accessor :human_score, :computer_score

  def play
    display_welcome_message()
    @@human_name, @@computer_name = get_names()
    human_flag = p1_goes_first?()
    @@human_marker = set_human_marker()
    @human_score = 0
    @computer_score = 0

    loop do
      board = Board.new
      player1 = Player.new
      player2 = Player.new(human: false)
      winner = nil

      loop do
        board.display
        current_player_moves(board, player1, player2, human_flag)
        break if (winner = board.winner) || board.full?
        human_flag = !(human_flag)
      end

      board.display
      display_and_count_winner(winner)
      break if overall_winner?() || (play_again?() == false)
    end

    display_goodbye_message()
  end

  private

  def self.get_human_name
    @@human_name
  end

  def self.get_computer_name
    @@computer_name
  end

  def get_names
    name_arr = []

    loop do
      puts "What's your name?"
      input = gets.chomp.capitalize
      break name_arr << input if !input.nil?
      puts "Invalid input, try again."
    end

    name_arr << %w(R2D2 IronMan DaVinciPC TTTGod ChatGPT).sample
  end

  def self.get_human_marker
    @@human_marker
  end

  def set_human_marker
    loop do
      puts
      puts "Select a marker with a single character - e.g. 'X'"
      input = gets.chomp
      return input if input.length == 1
      puts "Invalid marker, try again."
    end
  end

  def p1_goes_first?
    hname = TTTGame::get_human_name
    cname = TTTGame::get_computer_name

    loop do
      puts
      puts "Who should pick who goes first? (1) #{hname} OR (2) #{cname}"
      input = gets.chomp.capitalize
      break if input == hname || input.include?('1')
      return [true, false].sample if input == cname || input.include?('2')
      puts "Invalid input, try again."
    end

    loop do
      puts "Who goes first? (1) #{hname} OR (2) #{cname}"
      input2 = gets.chomp.capitalize
      return true if input2 == hname || input2.include?('1')
      return false if input2 == cname || input2.include?('2')
      puts "Invalid input, try again."
    end
  end

  def overall_winner?
    hname = TTTGame::get_human_name
    cname = TTTGame::get_computer_name

    if @human_score == 5 || @computer_score == 5
      winner = (@human_score == 5 ? hname : cname)
      puts
      puts "#{winner} is the overall winner!"
      return true
    end

    false
  end

  def current_player_moves(board, player1, player2, human_flag)
    if human_flag
      player1.mark(board)
    else
      player2.mark(board)
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts "Squares are numbered 1-9 from the top L to the bottom R."
    puts
  end

  def display_and_count_winner(winner)
    hname = TTTGame::get_human_name
    cname = TTTGame::get_computer_name

    return puts "It's a tie!" if winner.nil?
    @human_score += 1 if winner == TTTGame::get_human_marker
    @computer_score += 1 if winner == COMPUTER_MARKER
    puts "#{winner} is the winner!"
    puts "Overall Score: #{hname} - #{@human_score} & #{cname} - #{@computer_score}."
  end

  def display_goodbye_message
    puts "Thanks for playing, Goodbye!"
  end

  def play_again?
    input = nil
    loop do
      puts "Would you like to play again? (y/n)"
      input = gets.chomp.downcase
      break if input.include?('y') || input.include?('n')
      puts "Invalid input, try again."
    end
    puts
    input.include?('y')
  end
end

game = TTTGame.new
game.play
