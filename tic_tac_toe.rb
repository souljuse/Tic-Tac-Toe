require_relative "lib/game"
require_relative "lib/player"


puts "Welcome to Tic Tac Toe!"
puts "Player 1 name: "
player1_name = gets.chomp
puts "Type a character (default x)"
weapon1 = gets.chomp
if weapon1.empty?
  weapon1 = 'x'
end
player1 = Player.new(player1_name, weapon1)

puts "Player 2 name: "
player2_name = gets.chomp
puts "Type a character (default o):"
weapon2 = gets.chomp
if weapon2.empty?
  weapon2 = 'o'
end
if weapon1 == weapon2
  puts "{#{weapon2}} was already chosen"
  weapon2 = gets.chomp
else
  player2 = Player.new(player2_name, weapon2)
end

game = Game.new(player1, player2)

while !game.is_game_over? || game.log.size == 9
  puts "Type the number of the tile where you want to place your symbol. Your move:"
  tile = gets.chomp.to_i
  game.current_player.move(game, tile)
  game.print_grid
  if game.is_current_player_winning?(game.current_player)
    puts "#{game.current_player.name} won!"
  else
    game.switch
  end
  if game.log.size == 9
    puts 'The game is a tie!'
  end
end
