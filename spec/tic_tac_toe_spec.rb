require 'spec_helper'

describe "#create player" do
  it "should welcome a new player with input name" do
    player = Player.new
    player.stub(:gets).and_return("xena")
    expect(player.enters_battle).to eq(puts "Welcome Xena, let's battle")
  end
end
