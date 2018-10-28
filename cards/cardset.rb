# frozen_string_literal: true

class Cardset
  attr_reader :cards

  def initialize
    discart
  end

  # No need for old cards at the begining of round
  def discart
    @cards = []
  end
end
