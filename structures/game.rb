class Game
  attr_reader :players
  attr_reader :trump
  attr_reader :bank

  def initialize
    @players = [
        Dealer.new('Dealer 1'),
        Dealer.new('Dealer 2'),
        Dealer.new('Dealer 3')
    ]

    take_new_trump

    @players.each do |p|
      p.set_trump(@trump)
    end

    @bank  = 0
  end

  def play
    if have_winner?
      congrats_winner
      return false
    end

    @players.each do |p|
      @bank += p.to_bet
      p.take_cards
    end

    display_bank

    @players.each do |p|
      p.make_a_move
    end

    award(winner)

    reject_bankrupts

    @players.each do |p|
      p.discard_cards
    end

    take_new_trump

    true
  end

  def take_new_trump
    puts "New trump used in game."
    @trump = Cardset.new('trump')
    @trump.generate_set
  end

  def award(winner)
    if winner
      winner.get_win(@bank)
    else
      @players.each {|p| p.get_win(p.bet)}
    end

    @bank = 0
  end

  def winner
    players = @players.reject {|p| p.overpoints? }
    players.sort!{|x, y| x.points <=> y.points}

    puts "#{players.map {|p| "#{p.name} #{p.points}"}} "

    players.last
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

  def have_winner?
    @players.size < 2
  end

  def congrats_winner
    puts "Game ended. Winner is #{@players.first}."
    puts "Congrats!"
  end

  def display_bank
    puts "Bank contains #{@bank} dollars."
  end
end
