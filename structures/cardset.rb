# frozen_string_literal: true

# Deck or players cards
class Cardset
  attr_reader :cards

  def initialize(owner)
    @owner = owner
    @cards = []
  end

  def generate_set
    Card.names_list.each do |n|
      Card.suits_list.each do |s|
        @cards.push Card.new(s, n)
      end
    end
  end

  def give(number = 2)
    to_give = @cards.sample(number)
    @cards.delete(to_give)

    to_give
  end

  def receive(arr)
    @cards += arr
  end

  def to_s
    @cards.join ', '
  end

  def points
    @cards.inject(0) { |sum, c| sum + c.points }
  end

  def overheat?
    points > 21
  end
end
