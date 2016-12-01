class Game
  attr_reader :grid_array
  attr_accessor :current_player, :other_player
  attr_writer :game_over
  def initialize
    @grid_array = [" "," "," "," "," "," "," "," "," "]
    @game_over = false
    @current_player
    @other_player
  end

  def print_grid
    puts " #{@grid_array[0]} | #{@grid_array[1]} | #{@grid_array[2]} "
    puts "-----------"
    puts " #{@grid_array[3]} | #{@grid_array[4]} | #{@grid_array[5]} "
    puts "-----------"
    puts " #{@grid_array[6]} | #{@grid_array[7]} | #{@grid_array[8]} "
  end

  def insert_move(place, weapon)
    @grid_array[place] = weapon
  end

  def is_current_player_winning?(symbol)
    sequence = @grid_array.each_index.select{|i| @grid_array[i] == symbol}
    # winning_sequence = "#{symbol}#{symbol}#{symbol}"
    # @grid_array[0] == symbol && @grid_array[0] == symbol && @grid_array[0] == symbol ? true : false
    check_if_win(sequence) ? true : false
  end

  def check_if_win(sequence)
    winning_sequences = [[0,1,2],[3,4,5],[6,7,8],
                        [0,3,6],[1,4,7],[2,5,8],
                        [0,4,8],[2,4,6]]
    winning_sequences.include?(sequence) ? true : false
    # @grid_array(0..3).join('').include? winning_sequence
    # @grid_array(3..5).join('').include? winning_sequence
    # @grid_array(6..8).join('').include? winning_sequence
    # @grid_array(0..3).join('').include? winning_sequence
    # @grid_array.values_at(1, 4, 6) (0..3).join('').include? winning_sequence
  end

  def is_game_over?
    @game_over
  end

  def switch
    temp = @current_player
    @current_player = @other_player
    @other_player = temp
  end
end
