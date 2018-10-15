class Game
  attr_reader :players
  attr_reader :trump

  def inialize
    @players = [
        Dealer.new,
        Player.new
    ]

    @trump = Cardset.new('trump')
    @trump.generate_set
  end

  def welcome
    puts "Welcome in 'Black Jack' game!"
    puts

    @players.each { |p| puts "Hello, #{p}" }
  end

  def reject_bankrupts
    @players.reject! do |p|
      if p.bankrupt?
        puts "Player #{p} is bankrupt and leaving game."
        true
      end
    end
  end

  def congrats_to_winner
    puts "Game ended. Winner if #{@players.first}."
    puts "Congrats!"
  end

  def play
  end
end
