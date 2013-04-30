require 'rspec'
require 'deck'


describe Deck do
  let(:deck) {Deck.new}

  describe "#initialize" do
    it "initializes with all the cards" do
      deck.count.should == 52
    end
  end

  describe "#shuffle" do
    pending
  end

  describe "#take(n)" do
    pending
    deck.take(2)
    deck.count.should == 50
  end

end