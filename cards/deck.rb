# frozen_string_literal: true

class Deck < Cardset
  # Each game has brand new deck
  def generate_set
    Card::NAMES.each do |n|
      Card::SUITS.keys.each do |s|
        @cards.push Card.new(s, n)
      end
    end
  end

  # Cards from deck are going to Actor's cardset
  def give(number = 2)
    to_give = @cards.sample(number)

    @cards -= to_give

    to_give
  end
end
