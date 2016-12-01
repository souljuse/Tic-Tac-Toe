require_relative "lib/game"
require_relative "lib/player"

game = Game.new
puts "Welcome to Tic Tac Toe!"
puts "Player 1 name: "
player1_name = gets.chomp
player1 = Player.new(player1_name)
player1.select_weapon
puts "Player 2 name: "
player2_name = gets.chomp
player2 = Player.new(player2_name)
player2.select_weapon
game.current_player = player1
game.other_player = player2

while !game.is_game_over?
  puts "Type the number of the tile where you want to place your symbol. Your move:"
  tile = gets.chomp.to_i
  game.current_player.move(game, tile)
  game.print_grid
  if game.is_current_player_winning?(game.current_player.weapon)
    game.game_over = true
    puts "#{game.current_player.name} won!"
  else
    game.switch
  end
end
