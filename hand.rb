# frozen_string_literal: true

class Hand < Cardset
  def receive(arr)
    @cards += arr
  end

  def to_s
    @cards.join ', '
  end

  def points
    @cards.inject(0) { |sum, c| sum + c.points }
  end

  def overheat?
    points > 21
  end
end
