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

  def straight_flush?
    straight? && flush?
  end

  def number_times
    num_times = {}
    @cards.group_by{|i| i.int_value}.each{|key, value| num_times[key] = value.size}
    num_times
  end

  def nothing?
    results = number_times
    results.values.all?{|i| i == 1}
  end

  def one_pair?
    results = number_times
    results.values.one?{|i| i == 2}
  end

  def three_kind?
    results = number_times
    results.values.one?{|i| i == 3}
  end

  def four_kind?
    results = number_times
    results.values.one?{|i| i == 4}
  end

  def two_pair?
    count = 0
    results = number_times
    results.values.each do |i|
       count += 1 if i == 2
    end
    count == 2
  end

  def full_house?
    one_pair? && three_kind?
  end


end