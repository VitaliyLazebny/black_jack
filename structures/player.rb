# frozen_string_literal: true

# Human player class.
# To make move used users input.
class Player < Actor
  def initialize(game)
    @game  = game
    @money = 100
    @bet   = 10
    name
    discard_cards
  end

  def name
    unless @name
      game.interface.say 'Please enter your name:'
      @name = game.interface.ask
    end

    @name
  end

  def display_moves
    game.interface.say "Please choose move:\n"\
      "1. Get a card.\n"\
      "2. Skip step.\n"\
      "3. Open cards."
  end

  def make_a_move
    display_moves

    i = game.interface.ask

    case i.to_i
    when 1
      take_card
    when 3
      game.interface.say "#{self}. Want to open cards."
    else
      # including 2
      game.interface.say "#{self}. Do nothing."
    end
  end
end
