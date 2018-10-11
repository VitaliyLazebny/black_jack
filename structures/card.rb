# Names: 'Six', 'Seven', 'Eight', 'Nine',
#        'Ten', 'Jack', 'Queen', 'Кing',
#        'Ace', 'Wild card'
#
# Suits: 'Diamond', 'Spade', 'Club', 'Heart'
class Card
  SUITS = {Diamond: "\u25C6",
           Spade:   "\u2660",
           Club:    "\u2663",
           Heart:   "\u2665"}.freeze
  NAMES = {Six:          6,
           Seven:        7,
           Eight:        8,
           Nine:         9,
           Ten:         10,
           Jack:         2,
           Queen:        3,
           Кing:         4,
           Ace:          5,
           'Wild card': 11}.freeze

  def self.SUITS_LIST
    SUITS.keys
  end

  def self.NAMES_LIST
    NAMES.keys
  end

  attr_reader :suit

  def initialize(suit, name)
    @suit   = suit
    @name   = name
  end

  def name
    return points if points.between?(6, 10)
    @name
  end

  def points
    NAMES[@name]
  end

  def to_s
    "#{name}#{SUITS[suit]}"
  end
end
