class Money
  attr_reader :pot
  attr_reader :player
  attr_reader :dealer

  def initialize
    @pot    = 0
    @player = 100
    @dealer = 100
  end
end