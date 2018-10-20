# frozen_string_literal: true

# Base class for players: human and computer
#
# expected to redefine @name method for ancessors
class Actor
  attr_reader   :game
  attr_reader   :cards
  attr_reader   :money
  attr_accessor :bet

  def initialize(game, name)
    @game  = game
    @name  = name
    @money = 100
    @bet   = 10
    discard_cards
  end

  def set_trump(trump)
    game.interface.say "#{self}. I can see the trump."
    @trump = trump
  end

  def discard_cards
    game.interface.say "#{self}. Discard cards."
    @cards = Cardset.new(self)
  end

  def to_bet
    raise "It's #{self}. I'm bankrupt and can't bet" if bankrupt?

    @money -= @bet

    game.interface.say "#{self}. I'm betting #{@bet} dollar#{@bet == 1 ? '' : 's'}."
    @bet
  end

  def get_win(money)
    @money += money
    game.interface.say "#{self}. Got a win #{money} dollars."
  end

  def take_cards(number = 2)
    game.interface.say "#{self}. I'm taking #{number} card#{number == 1 ? '' : 's'}."

    cards = @trump.give(number)
    @cards.receive(cards)
    display_cards
  end

  def take_card
    take_cards(1)
  end

  def display_cards
    game.interface.say "#{self}. My cards are: #{@cards}. Total: #{@cards.points}"
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
    raise 'method "name" should be redefined' unless @name
    @name
  end

  def to_s
    name
  end
end
