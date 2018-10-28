# frozen_string_literal: true

class Deck < Cardset
  def generate_set
    Card::NAMES.each do |n|
      Card::SUITS.keys.each do |s|
        @cards.push Card.new(s, n)
      end
    end
  end

  def give(number = 2)
    to_give = @cards.sample(number)

    @cards -= to_give

    to_give
  end
end
