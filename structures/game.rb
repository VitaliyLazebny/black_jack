# frozen_string_literal: true

# Game defines rules and sequencing
class Game
  attr_accessor :interface
  attr_reader   :players
  attr_reader   :trump
  attr_reader   :bank

  def initialize(interface)
    @interface = interface

    @players = [
      Player.new(self),
      Dealer.new(self,'Dealer 1')
    ]

    take_new_trump

    @players.each do |p|
      p.set_trump(@trump)
    end

    @bank = 0
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

    @players.each(&:make_a_move)

    award(winner)

    @players.each do |p|
      interface.say "#{p}. Had #{p.cards}. Total: #{p.points}."
      p.discard_cards
    end

    take_new_trump

    reject_bankrupts

    true
  end

  def take_new_trump
    interface.say 'New trump used in game.'
    @trump = Cardset.new('trump')
    @trump.generate_set
  end

  def award(winner)
    if winner
      winner.get_win(@bank)
    else
      @players.each { |p| p.get_win(p.bet) }
    end

    @bank = 0
  end

  def winner
    players = @players.reject(&:overpoints?)
    players.sort! { |x, y| x.points <=> y.points }

    players.last
  end

  def welcome
    interface.say 'Welcome in \'Black Jack\' game!'

    @players.each { |p| interface.say "Hello, #{p}" }
  end

  def reject_bankrupts
    @players.reject! do |p|
      if p.bankrupt?
        interface.say "Player #{p} is bankrupt and leaving game."
        true
      end
    end
  end

  def have_winner?
    @players.size < 2
  end

  def congrats_winner
    interface.say "Game ended. Winner is #{@players.first}. \n"\
      'Congrats!'
  end

  def display_bank
    interface.say "Bank contains #{@bank} dollars."
  end
end
