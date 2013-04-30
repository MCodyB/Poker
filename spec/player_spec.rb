# Player
# Each player has a hand, plus a pot
# Player has methods to ask the user:
# Which cards they wish to discard
# Whether they wish to fold, see, or raise.

require 'rspec'
require 'player'
require 'game'

describe Player do
  let(:game) {Game.new}
  let(:deck) {Deck.new}
  let(:player) {Player.new("Scotty",1000, game, deck)}
  let(:hand) {Hand.deal_in(deck)}

  describe "initialize" do
    it "has a bankroll" do
      player.bankroll.should == 1000
    end

    it "has a name" do
      player.name.should == "Scotty"
    end
  end

  describe "#less_bank" do
    it "decreases the bankroll" do
      player.less_bank(100)
      player.bankroll.should == 900
    end

    it "raises error if bet too much" do
      expect {player.less_bank(1100)}.to raise_error("not enough money")
    end

    it "calls game take bet" do
      game.should_receive(:take_bet).with(100)
      player.less_bank(100)
    end

    it "it increase the game's pot" do
      player.less_bank(100)
      game.pot.should == 100
    end
  end

  describe "#more_bank" do
    it "increases bankroll" do
      player.more_bank(100)
      player.bankroll.should == 1100
    end

    it "decreases the pot to zero" do
      player.more_bank(100)
      game.pot.should == 0
    end
  end

  describe "#discard" do
    pending
  end

  describe "fold" do
    it "sets hand to nil" do
      player.hand = Hand.deal_in(deck)
      player.fold
      player.hand.should be_nil
    end

    it "returns cards to the deck" do
      player.hand = Hand.deal_in(deck)
      test_size = deck.count
      player.fold
      deck.count.should > test_size
    end
  end

  describe "see" do
    pending
  end

  describe "increase_bet" do
    pending
  end

end
