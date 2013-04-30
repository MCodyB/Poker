require 'rspec'
require 'card'

describe Card do
  let(:card) {Card.new(:clubs, :three)}
  describe "#initialize" do
    it "initializes with suit and value" do
      card.suit.should == :clubs
      card.value.should == :three
    end

    it "raises error if card initialized with invalid suit" do
      expect {card = Card.new(:asdfad, :three)}.to raise_error("Not a suit")
    end

    it "raises error if card initialized with invalid value" do
      expect {card = Card.new(:clubs, :asdfa)}.to raise_error("Invalid value")
    end
  end
end
