class Cardset
  attr_reader :cards

  def initialize(owner)
    @owner = owner
    @cards = []
  end

  def generate_set
    Card.NAMES_LIST.each do |n|
      Card.SUITS_LIST.each do |s|
        @cards.push Card.new(s, n)
      end
    end
  end

  def give(number = 2)
    puts "Taken 2 cards from #{@owner}"
    to_give  = @cards.sample(number)
    @cards.delete(to_give)

    to_give
  end

  def receive(arr)
    puts "Received 2 cards by #{@owner}"

    @cards += arr
  end

  def to_s
    @cards.join ", "
  end

  def points
    @cards.inject(0){|sum, c| sum + c.points }
  end

  def overheat?
    points > 21
  end
end
