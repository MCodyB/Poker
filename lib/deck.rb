require_relative "card"

class Deck
  attr_accessor :cards

  def self.beginning
    cards = []
    Card.suits.each do |suit, string|
      Card.strings.each do |value, string|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  def initialize(cards=Deck.beginning)
    raise "Must initialize with array" unless cards.is_a?(Array)
    @cards = cards
  end

  def count
    @cards.count
  end

  def shuffle!
    @cards.shuffle!
  end

  def take(n)
    @cards.shift(n)
  end

  def return_cards(cards)
    @cards.push(*cards)
  end

end