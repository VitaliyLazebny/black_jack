# frozen_string_literal: true

class Dealer < Actor
  def make_a_move
    if @cards.points > 17
      puts "#{self}. Do nothing."
    else
      take_card
    end
  end

  def display_cards
    puts "#{self}. Don't want to show cards."
  end
end
