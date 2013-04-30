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

      it "returns false if not straight" do
        hand.straight?.should == false
      end
    end

    describe "#one_pair?" do
      let(:one_pair) {Hand.new([
      Card.new(:clubs,:three),Card.new(:hearts,:three),
      Card.new(:spades,:queen),Card.new(:hearts, :king),
      Card.new(:spades, :five)])}
      it "returns true if one pair" do
        one_pair.one_pair?.should == true
      end

      it "returns false if not one pair" do
        hand.one_pair?.should == false
      end

    end

    describe "#two_pairs?" do
      let(:two_pairs) {Hand.new([
      Card.new(:clubs,:three),Card.new(:hearts,:three),
      Card.new(:spades,:queen),Card.new(:hearts, :queen),
      Card.new(:spades, :five)])}
      it "returns true if two_pairs" do
        two_pairs.two_pairs?.should == true
      end

      it "returns false if not two_pairs" do
        hand.two_pairs?.should == false
      end
    end

    describe "#three_kind?" do
      let(:three_kind) {Hand.new([
      Card.new(:clubs,:three),Card.new(:hearts,:three),
      Card.new(:spades,:three),Card.new(:hearts, :queen),
      Card.new(:spades, :five)])}
      it "returns true if three_kind" do
        three_kind.three_kind?.should == true
      end

      it "returns false if not three_kind" do
        hand.three_kind?.should == false
      end

    end

    describe "#full_house?" do
      let(:full_house) {Hand.new([
      Card.new(:clubs,:three),Card.new(:hearts,:three),
      Card.new(:spades,:five),Card.new(:hearts, :five),
      Card.new(:spades, :five)])}
      it "returns true if full_house" do
        full_house.full_house?.should == true
      end

      it "returns false if not full_house" do
        hand.full_house?.should == false
      end

    end

    describe "#four_kind?" do
      let(:four_kind) {Hand.new([
      Card.new(:clubs,:three),Card.new(:hearts,:three),
      Card.new(:spades,:three),Card.new(:diamonds, :three),
      Card.new(:spades, :five)])}
      it "returns true if four_kind" do
        four_kind.four_kind?.should == true
      end

      it "returns false if not four_kind" do
        hand.four_kind?.should == false
      end

    end

    describe "#straight_flush?" do
      let(:straight_flush) {Hand.new([
        Card.new(:clubs,:three),Card.new(:clubs,:deuce),
        Card.new(:clubs,:four),Card.new(:clubs, :six),
        Card.new(:clubs, :five)])}
        it "returns true if straight flush" do
          straight_flush.straight_flush?.should == true
        end

        it "returns false if not straight flush" do
          hand.straight_flush?.should == false
        end
    end

    describe "#high_card" do
      it "returns the highest value" do
        hand.high_card.should == 13
      end
    end

    describe "#number_times" do
      let(:four_kind) {Hand.new([
      Card.new(:clubs,:three),Card.new(:hearts,:three),
      Card.new(:spades,:three),Card.new(:diamonds, :three),
      Card.new(:spades, :five)])}
      it "returns a hash of occurances of values" do
        four_kind.number_times.should == {3 => 4, 5 => 1}
      end
    end

    describe "#get_hand_score" do
      let(:four_kind) {Hand.new([
      Card.new(:clubs,:three),Card.new(:hearts,:three),
      Card.new(:spades,:three),Card.new(:diamonds, :three),
      Card.new(:spades, :five)])}
      it "sets the hand score" do
        four_kind.get_hand_score
        four_kind.hand_score.should == 185
      end
    end
  end

end












