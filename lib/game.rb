class Game
  attr_reader :grid_array, :game_over, :log
  attr_accessor :current_player, :other_player

  def initialize(player1, player2)
    @grid_array = [" "," "," "," "," "," "," "," "," "]
    @game_over = false
    @current_player = player1
    @other_player = player2
    @log = []
  end

  def print_grid
    puts " #{@grid_array[0]} | #{@grid_array[1]} | #{@grid_array[2]} "
    puts "-----------"
    puts " #{@grid_array[3]} | #{@grid_array[4]} | #{@grid_array[5]} "
    puts "-----------"
    puts " #{@grid_array[6]} | #{@grid_array[7]} | #{@grid_array[8]} "
  end

  def insert_move(index, weapon)
    if is_move_valid?(index)
      @log << index
      @grid_array[index] = weapon
    else
      raise "This place is already taken"
    end
  end

  def is_move_valid?(index)
    @log.include?(index) ? false : true
  end

  def is_current_player_winning?(player)
    sequence = @grid_array.each_index.select{|i| @grid_array[i] == player.weapon}
    check_if_win(sequence) ? true : false
  end

  def check_if_win(sequence)
    winning_sequences = [[0,1,2],[3,4,5],[6,7,8],
                        [0,3,6],[1,4,7],[2,5,8],
                        [0,4,8],[2,4,6]]
    if winning_sequences.include?(sequence)
      @game_over = true
      return true
    else
      return false
    end
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
