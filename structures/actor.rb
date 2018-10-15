def Actor
  attr_reader   :cards
  attr_reader   :money
  attr_accessor :bet

  def initialize(cards)
    @cards = Cardset.new(self)
    @money = 100
    @bet   = 10
  end

  def bet
    fail "It's #{self}. I'm bankrupt and can't bet" if bankrupt?

    @money -= @bet
    @bet
  end

  def take_cards(number = 1)
    puts "#{self}. I'm taking #{number} cards."
  end

  def bankrupt?
    @money < @bet
  end

  def name
    fail 'method "name" should be redefined'
  end

  def to_s
    name
  end
end
