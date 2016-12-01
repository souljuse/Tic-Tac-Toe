require 'spec_helper'

describe Game do
  describe "#grid_array" do
    let(:player1) { Player.new("Xena") }
    let(:player2) { Player.new("Olimpia", "o") }
    let(:game){ Game.new(player1, player2) }
    it "should start with empty grid" do
      expect(game.grid_array).to eq([" "," "," "," "," "," "," "," "," "])
    end

    context "when player moves" do
      it "should register the move on the grid" do
        player1.move(game, 4)
        expect(game.grid_array).to eq([" "," "," "," ","x"," "," "," "," "])
        player2.move(game, 3)
        expect(game.grid_array).to eq([" "," "," ","o","x"," "," "," "," "])
      end

      it "should not allow two equal moves" do
        player1.move(game, 4)
        expect{player2.move(game, 4)}.to raise_exception
      end
    end

    context "when player wins" do
      it "if game has not finished yet" do
        player1.move(game, 0)
        player1.move(game, 1)
        game.is_current_player_winning?(player1)
        expect(game.game_over).to eq(false)
      end
      it "if player get three symbols in a row wins" do
        player1.move(game, 0)
        player1.move(game, 1)
        player1.move(game, 2)
        game.is_current_player_winning?(player1)
        expect(game.game_over).to eq(true)
      end
    end
  end
end
