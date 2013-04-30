# -*- coding: utf-8 -*-
class Card
  attr_reader :suit, :value
  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUE_STRINGS = {
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

  VALUE_INTEGERS = {
    :deuce => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 11,
    :queen => 12,
    :king  => 13
  }

  def self.suits
    SUIT_STRINGS
  end

  def self.strings
    VALUE_STRINGS
  end

  def to_s
    "#{self.suit}#{self.value}"
  end

  def initialize(suit, value)
    raise "Not a suit" unless Card.suits.include?(suit)
    raise "Invalid value" unless Card.strings.include?(value)
    @suit = suit
    @value = value
  end
end