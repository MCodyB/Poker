require 'rspec'
require 'hand'
require 'deck'
require 'card'


describe Hand do
  let(:hand) {Hand.new([
    Card.new(:clubs,:three),Card.new(:hearts,:deuce),
    Card.new(:spades,:queen),Card.new(:hearts, :king),
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

  context "hand combinations" do

    describe "#flush?" do
      let(:flush) {Hand.new([
      Card.new(:clubs,:three),Card.new(:clubs,:deuce),
      Card.new(:clubs,:queen),Card.new(:clubs, :king),
      Card.new(:clubs, :five)])}
      it "returns true if flush" do
        flush.flush?.should == true
      end

      it "returns false if not flush" do
        hand.flush?.should == false
      end
    end

    describe "#straight?" do
      let(:straight) {Hand.new([
      Card.new(:clubs,:three),Card.new(:hearts,:deuce),
      Card.new(:spades,:four),Card.new(:hearts, :six),
      Card.new(:spades, :five)])}
      it "returns true if straight" do
        straight.straight?.should == true
      end

      it "returns false if not flush" do
        hand.straight?.should == false
      end

    end

    describe "#one_pair?" do
      let(:one_pair) {Hand.new([
      Card.new(:clubs,:three),Card.new(:hearts,:three),
      Card.new(:spades,:queen),Card.new(:hearts, :king),
      Card.new(:spades, :five)])}
      pending
    end

    describe "#two_pair?" do
      let(:two_pair) {Hand.new([
      Card.new(:clubs,:three),Card.new(:hearts,:three),
      Card.new(:spades,:queen),Card.new(:hearts, :queen),
      Card.new(:spades, :five)])}
      pending
    end

    describe "#three_kind?" do
      let(:three_kind) {Hand.new([
      Card.new(:clubs,:three),Card.new(:hearts,:three),
      Card.new(:spades,:three),Card.new(:hearts, :queen),
      Card.new(:spades, :five)])}
      pending
    end

    describe "#full_house?" do
      let(:full_house) {Hand.new([
      Card.new(:clubs,:three),Card.new(:hearts,:three),
      Card.new(:spades,:five),Card.new(:hearts, :five),
      Card.new(:spades, :five)])}
      pending
    end

    describe "#four_kind?" do
      let(:four_kind) {Hand.new([
      Card.new(:clubs,:three),Card.new(:hearts,:three),
      Card.new(:spades,:three),Card.new(:diamonds, :three),
      Card.new(:spades, :five)])}
      pending
    end

    describe "#straight_flush?" do
      let(:flush) {Hand.new([
        Card.new(:clubs,:three),Card.new(:clubs,:deuce),
        Card.new(:clubs,:four),Card.new(:clubs, :six),
        Card.new(:clubs, :five)])}

      pending
    end

    describe "high_card" do
      it "returns the highest value" do
        hand.high_card.value.should == :king
      end
    end

  end

end












