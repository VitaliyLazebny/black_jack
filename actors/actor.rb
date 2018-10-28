class Actor
  attr_reader :money

  def initialize
    @cards = Hand.new
    @money = 100

    @bet   = 10
  end

  def pick_up_winnings(amount)
    @money += amount
  end

  def bet
    @money -= @bet
    @bet
  end

  def discart_cards
    @cards.discart
  end

  def cards
    @cards.to_s
  end

  def take_cards(cards)
    @cards.receive cards
  end

  def points
    @cards.points
  end

  def overheat?
    @cards.overheat?
  end

  def bankrupt?
    @money < @bet
  end
end
