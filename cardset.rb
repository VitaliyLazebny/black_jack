# frozen_string_literal: true

class Cardset
  attr_reader :cards

  def initialize
    discart
  end

  def discart
    @cards = []
  end

  def receive(cards)
    @cards += cards
  end
end
