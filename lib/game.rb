require 'player'
require 'game'
require 'deck'

class Game
  attr_reader :players, :pot, :deck

  def initialize
    @players = []
    @deck = Deck.new.shuffle!
    @pot = 0
  end

  def set_players
    printf "How many players?: "
    num_players = gets.chomp.to_i
    num_players.times do |i|
      printf "Enter player #{i}'s name: "
      name = gets.chomp
      @players << Player.new(name, 1000, self)
    end
  end

  def take_bet(amt)
    @pot += amt
  end

  def pay_winnings
    @pot = 0
  end

  def assign_hands
    @players.each{|player| player.hand = Hand.deal_in(@deck)}
  end

  def compare_hands
    @players.max_by{|player| player.hand_score}
  end

  def play
  end
    # set_players
    # until 2 == 1
      # assign_hands
      # render.player.hand
      # puts "bet"
      #
      # players.each.{
      #bet = gets.chomp.to_i
      #take_bet(bet)}
      # p "How many cards to exchange? (max, 3)"
      # players.each{
      #cards = gets.chomp.to_i
      #player.hand.trade_in(cards)}
      # render new hand
      # players.each.{
      #bet = gets.chomp.to_i
      #take_bet(bet)}
      # winner = compare_hands
      # winner.pay_winnings.=
      #
      # player.take_bet()
      # @players.each do |name, player|
      #   puts "Ante up"
      #   player.take_bet(10, name)
      # end
      # assign


  # def get_ante
  #   p "Ante min is 10, ante up"
  #   players = []
  #   @players.each do |key, value|
  #     ante = gets.chomp.to_i
  #     if ante > 10
  #       players << key
  #       take_bet(ante, key)
  #     end
  #   end
  #   players
  # end

  def win?
    @players.size == 0 || @players.one?{|player| player.bankroll > 0 }
  end
end