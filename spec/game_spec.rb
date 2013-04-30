# Game
# Holds the deck
# Keeps track of who's turn it is
# Keeps track of the amount in the pot.
require 'rspec'
require 'game'
require 'deck'
require 'player'

describe Game do
  let(:game) {Game.new}
  let(:deck) {Deck.new}
  let(:players) {{"Test" => Player.new("Test",1000, game)}}

  describe "#initialize" do
    it "initializes a new deck" do
      game.deck.count.should == 52
    end

    it "initializes the pot to 0" do
      game.pot.should == 0
    end
  end

  # describe "#take_bet" do
#     it "gets the bet from the player - Works when hard coded" do
#       game.set_players
#       game.players["Test"].should_receive(:less_bank).with(100)
#       game.take_bet(100, "Test")
#     end
#
#     it "accrues the pot - Works when hard coded" do
#       game.set_players
#       game.take_bet(100, "Test")
#       game.pot.should == 100
#     end
#   end

  describe "#set_players" do
    it "adds players to @players" do
      pending("how to test gets")
      game.set_players
      game.players.size.should == 1
    end
  end

end