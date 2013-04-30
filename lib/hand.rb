require 'deck'
require 'card'

class Hand
  attr_reader :cards

  def initialize(cards)
    raise "Must initialize with array" unless cards.is_a?(Array)
    @cards = cards
  end

  def self.deal_in(deck)
    Hand.new(deck.take(5))
  end

  def count
    @cards.count
  end

  def return_cards(deck, cards)
    deck.return_cards(cards)
    @cards.delete_if{|card| cards.include?(card)}
  end

  def add_card(deck)
    @cards << deck.take(1)
  end

  def trade_in(deck, cards)
    raise "too many for trade in" if cards.size > 3
    return_cards(deck, cards)
    cards.size.times{add_card(deck)}
  end

end