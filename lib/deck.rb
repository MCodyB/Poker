require "card"

class Deck
  attr_accessor :cards

  def initialize
    @cards = []

    CARD.suits.each do |suit|
      CARD.strings.each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end

  def count
    @cards.count
  end


end