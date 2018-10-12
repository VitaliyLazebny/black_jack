class Trump
  attr_reader :cards

  def initialize
    @cards = []

    Card.NAMES_LIST.each do |n|
      Card.SUITS_LIST.each do |s|
        @cards.push Card.new(s, n)
      end
    end
  end
end
