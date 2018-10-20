# frozen_string_literal: true

# Non human player
# Most of methods are defined at Actor class
class Dealer < Actor
  def make_a_move
    if @cards.points > 17
      game.interface.say "#{self}. Do nothing."
    else
      take_card
    end
  end

  def display_cards
    game.interface.say "#{self}. Don't want to show cards."
  end
end
