class Player
  attr_reader :name
  
  def initialize (player_name)
    @name = player_name
    @weapon
  end

  attr_reader :weapon

  def select_weapon
    puts "Type X or O:"
    @weapon = gets.chomp
    if @weapon.include?("x") || weapon.include?("o")
      return @weapon
    else
      select_weapon
    end
  end

  def move(game, place)
    game.insert_move(place, @weapon)
  end
end
