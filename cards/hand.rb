# frozen_string_literal: true

class Hand < Cardset
  # Can accept cards from the deck
  def receive(cards)
    @cards += cards
  end

  # Human readable list of cards
  def to_s
    @cards.join ', '
  end

  def points
    result = @cards.inject(0) { |sum, c| sum + c.points }

    # Ace can be 1 and can be 11 (11 by default).
    # Lets correct points number as it was 1
    # if actor has too many points.
    if result > 21
      # supposed that actor can't have more then 3 cards
      # and more then 3 Aces.
      case @cards.select {|c| c.name == :Ace}.size
      when 1, 2
        result -= 10
      when 3
        result -= 20
      else
        # do nothing if there's no Aces
      end
    end

    result
  end

  # Player looses if he has to many of points
  def overheat?
    points > 21
  end
end
