# frozen_string_literal: true

class Actor
  attr_reader   :cards
  attr_reader   :money
  attr_accessor :bet

  def initialize(name)
    @name  = name
    discard_cards
    @money = 100
    @bet   = 10
  end

  def set_trump(trump)
    puts "#{self}. I can see the trump."
    @trump = trump
  end

  def discard_cards
    puts "#{self}. Discard cards."
    @cards = Cardset.new(self)
  end

  def to_bet
    fail "It's #{self}. I'm bankrupt and can't bet" if bankrupt?

    @money -= @bet

    puts "#{self}. I'm betting #{@bet} dollar#{@bet == 1 ? '' : 's'}."
    @bet
  end

  def get_win(money)

    @money += money
    puts "#{self}. Got a win #{money} dollars."
  end

  def take_cards(number = 2)
    puts "#{self}. I'm taking #{number} card#{number == 1 ? '' : 's'}."

    cards = @trump.give(number)
    @cards.receive(cards)
    display_cards
  end

  def take_card
    take_cards(1)
  end

  def display_cards
    puts "#{self}. My cards are: #{@cards}. Total: #{@cards.points}"
  end

  def bankrupt?
    @money < @bet
  end

  def overpoints?
    points > 21
  end

  def points
    @cards.points
  end

  def name
    fail 'method "name" should be redefined' unless @name
    @name
  end

  def to_s
    name
  end
end
