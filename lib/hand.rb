require 'deck'
require 'card'

class Hand
  attr_reader :cards, :hand_score



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
    x = @cards.max_by{|i| i.int_value}
    x.int_value
    # value = 0
#     high_card = nil
#     @cards.each do |card|
#       if card.int_value > value
#         value = card.int_value
#         high_card = card
#       end
#     end
#     high_card.int_value
  end

  def flush?
    @hand_score = 140 + high_card
    suit = @cards[0].suit
    @cards.all?{|card| card.suit == suit}
  end

  def straight?
    @hand_score = 120 + high_card
    a = @cards.collect{|card| card.int_value}.sort.uniq
    a.last - a.first == 4 && a.size == 5
  end

  def straight_flush?
    @hand_score = 200 + high_card
    straight? && flush?
  end

  def number_times
    num_times = {}
    @cards.group_by{|i| i.int_value}.each do |key, value|
      num_times[key] = value.size
    end
    num_times
  end

  def nothing?
    @hand_score = high_card
    results = number_times
    results.values.all?{|i| i == 1}
  end

  def one_pair?
    @hand_score = 60 + high_card
    results = number_times
    results.values.one?{|i| i == 2}
  end

  def three_kind?
    @hand_score = 100 + high_card
    results = number_times
    results.values.one?{|i| i == 3}
  end

  def four_kind?
    @hand_score = 180 + high_card
    results = number_times
    results.values.one?{|i| i == 4}
  end

  def two_pairs?
    @hand_score = 80 + high_card
    count = 0
    results = number_times
    results.values.each do |i|
       count += 1 if i == 2
    end
    count == 2
  end

  def full_house?
    @hand_score = 160 + high_card
    one_pair? && three_kind?
  end

  def get_hand_score
    return straight_flush? if straight_flush?
    return four_kind? if four_kind?
    return full_house? if full_house?
    return flush? if flush?
    return straight? if straight?
    return three_kind? if three_kind?
    return two_pairs? if two_pairs?
    return one_pair? if one_pair?
    return nothing? if nothing?
  end




end