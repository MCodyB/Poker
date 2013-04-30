require 'rspec'
require 'hand'
require 'deck'
require 'card'


describe Hand do
  let(:hand) {Hand.new([
    Card.new(:clubs,:three),Card.new(:hearts,:deuce),
    Card.new(:spades,:ace),Card.new(:hearts, :king),
    Card.new(:spades, :five)])}
  let(:deck) {Deck.new}
  describe "#self.deal_in" do
    it "creates a new instance with 5 cards from the deck" do
      hand.count.should == 5
    end

    it "deals in only card objects" do
      hand.cards.should be_all {|card| card.class == Card}
    end
  end

  describe "#return_cards" do
    it "reduces the number of cards from hand to deck" do
      hand.return_cards(deck, [hand.cards[0], hand.cards[2]])
      hand.count.should == 3
    end
  end

  describe "#add_card" do
    it "adds card to hand from deck" do
      hand.return_cards(deck, [hand.cards[0], hand.cards[2]])
      hand.add_card(deck)
      hand.count.should == 4
    end
  end

  describe "#trade_in" do
    it "returns hand of same size" do
      cards = [hand.cards[0], hand.cards[2]]
      hand.trade_in(deck, cards)
      hand.count.should == 5
    end

    it "returns different hand" do
      new_hand = hand.dup
      cards = [hand.cards[0], hand.cards[2]]
      hand.trade_in(deck, cards)
      hand.should_not == new_hand
    end
  end

end