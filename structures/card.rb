# Names: 'Six', 'Seven', 'Eight', 'Nine',
#        'Ten', 'Jack', 'Queen', 'Кing',
#        'Ace', 'Wild card'
#
# Suits: 'Diamond', 'Spade', 'Club', 'Heart'
class Card
  attr_reader :suit
  attr_reader :points
  attr_reader :name

  def initialize(suit, points, name)
    @suit   = suit
    @points = points
    @name   = name
  end

  def to_s

  end
end