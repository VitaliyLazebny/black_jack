# frozen_string_literal: true

class Deck < Cardset
  def generate_set
    Card.names_list.each do |n|
      Card.suits_list.each do |s|
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
