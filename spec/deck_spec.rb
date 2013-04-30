require 'rspec'
require 'deck'


describe Deck do
  let(:deck) {Deck.new}

  describe "#initialize" do
    it "initializes with all the cards" do
      deck.count.should == 52
    end

    it "raises error if not initialized with an array" do
      expect {Deck.new('hithere')}.to raise_error("Must initialize with array")
    end
  end

  describe "#shuffled " do
    it "shuffles the deck" do
      a = deck.dup
      deck.shuffle!.should_not == a
    end
  end

  describe "#take(n)" do
    it "take returns n cards, here 2" do
      a = deck.take(2)
      a.count.should == 2
    end

    it "reduces the deck size by 2" do
      deck.take(2)
      deck.count.should == 50
    end
  end

  describe "#return" do
    let(:d) {Deck.new([Card.new(:clubs, :three)])}
    let(:c) {[Card.new(:diamonds, :seven), Card.new(:hearts, :ace)]}
    it "adds cards to deck" do
      d.return_cards(c)
      d.count == 3
    end
  end


end