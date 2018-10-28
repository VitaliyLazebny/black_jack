# frozen_string_literal: true

# Abstract class for dealer and player
class Actor
  attr_reader :money

  # Actor have some cards, money and
  # he know how much he should bet
  def initialize
    @cards = Hand.new
    @money = 100

    @bet   = 10
  end

  # Get money from the bank
  def pick_up_winnings(amount)
    @money += amount
  end

  # Put money into bank
  def bet
    @money -= @bet
    @bet
  end

  # no need for cards from previous rounds
  def discart_cards
    @cards.discart
  end

  def cards
    @cards.to_s
  end

  # Take cards from deck and keep
  def take_cards(cards)
    @cards.receive cards
  end

  def points
    @cards.points
  end

  # more then 21 point?
  def overheat?
    @cards.overheat?
  end

  # have no money?
  def bankrupt?
    @money < @bet
  end
end
