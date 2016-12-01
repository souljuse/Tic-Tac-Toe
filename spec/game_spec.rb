require 'spec_helper'

describe Game do
  describe "#grid_array" do
    it "should start with empty grid" do
      game= Game.new
      expect(game.grid_array).to eq([" "," "," "," "," "," "," "," "," "])
    end

    context "when player moves" do
      let(:player) { double("Xena") }

      # let(:game) { double(grid_array:[" "," "," "," "," "," "," "," "," "]) }

      it "should register the move on the grid" do
        game = class_double("Game")
        expect(game).to receive(:insert_move).with(5, 'x')
        expect(game.grid_array).to eq([" "," "," "," ","x"," "," "," "," "])
      end

    end
  end
end
