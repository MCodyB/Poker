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

  def high_card
    value = 0
    high_card = nil
    @cards.each do |card|
      if card.int_value > value
        value = card.int_value
        high_card = card
      end
    end
    high_card
  end

  def flush?
    suit = @cards[0].suit
    @cards.all?{|card| card.suit == suit}
  end

  def straight?
    a = @cards.collect{|card| card.int_value}.sort.uniq
    a.last - a.first == 4 && a.size == 5
  end
  #
  # def
end