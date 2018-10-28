# frozen_string_literal: true

# Names: 'Six', 'Seven', 'Eight', 'Nine',
#        'Ten', 'Jack', 'Queen', 'King',
#        'Ace', 'Wild card'
#
# Suits: 'Diamond', 'Spade', 'Club', 'Heart'
class Card
  SUITS = { Diamond: "\u25C6",
            Spade:   "\u2660",
            Club:    "\u2663",
            Heart:   "\u2665" }.freeze
  NAMES = [2, 3, 4, 5, 6, 7, 8, 9,
           'Jack',
           'Queen',
           'Кing',
           'Ace'].freeze

  attr_reader :suit
  attr_reader :name

  def initialize(suit, name)
    @suit   = suit
    @name   = name
  end

  # Aces points deviation is corrected at
  # Hand.points method
  def points
    return 11 if @name       == :Ace
    return 10 if @name.class == String
    @name
  end

  def to_s
    "#{name}#{SUITS[suit]}"
  end
end
