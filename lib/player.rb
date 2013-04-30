require "hand"
require 'game'
require 'card'
require 'deck'

class Player
  attr_accessor :hand,  :bankroll
  attr_reader :name

  def initialize(name, bankroll, game, deck)
    @name = name
    @bankroll = bankroll
    @hand = nil
    @game = game
    @deck = deck
  end

  def less_bank(amt)
    raise("not enough money") if amt > @bankroll
    @bankroll -= amt
    @game.take_bet(amt)
  end

  def more_bank(amt)
    @bankroll += amt
    @game.pay_winnings
  end

  def discard(array)
    @hand.trade_in(deck, array)
  end

  def fold
    @hand.return_cards(@deck, @hand.cards)
    @hand = nil
  end

  def see(last_amount)
    less_bank(last_amount)
  end

  def increase_bet(higher, last_amount)
    less_bank(higher + last_amount)
  end
end