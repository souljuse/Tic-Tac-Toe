class Player
  attr_reader :name

  def initialize (player_name, weapon = 'x')
    @name = player_name
    @weapon = weapon
  end

  attr_reader :weapon

  def move(game, place)
    game.insert_move(place, @weapon)
  end
end
