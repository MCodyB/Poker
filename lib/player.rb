class Player
  attr_accessor :hand,  :bankroll
  attr_reader :name

  def initialize(name, bankroll, game)
    @name = name
    @bankroll = bankroll
    @hand = nil
    @game = game
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
    @hand = nil
  end

  def see(last_amount)
    less_bank(last_amount)
  end

  def increase_bet(higher, last_amount)
    less_bank(higher + last_amount)
  end
end