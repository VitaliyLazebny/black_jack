# frozen_string_literal: true

# Game defines rules and sequencing
class Game
  attr_reader :interface
  attr_reader :players
  attr_reader :trump
  attr_reader :bank

  attr_reader :current_step

  def initialize(interface)
    @interface = interface
    @bank = 0

    @players = [
      #Player.new(self),
      Dealer.new(self, 'Dealer 1'),
      Dealer.new(self, 'Dealer 2')
    ]

    take_new_trump

    @players.each do |p|
      p.set_trump(@trump)
    end
  end

  def play
    return false if congrats_winner

    all_players_bet
    all_players_take_cards
    display_bank
    players_make_move
    award_winner
    players_show_cards
    take_new_trump
    reject_bankrupts

    true
  end

  def take_new_trump
    interface.say 'New trump used in game.'
    @trump = Cardset.new('trump')
    @trump.generate_set
  end

  def players_show_cards
    @players.each do |p|
      interface.say "#{p}. Had #{p.cards}. Total: #{p.points}."
      p.discard_cards
    end
  end

  def players_make_move
    @players.each &:make_a_move
  end

  def award_winner
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

  def all_players_bet
    @players.each do |p|
      @bank += p.to_bet
    end
  end

  def all_players_take_cards
    @players.each &:take_cards
  end

  def have_winner?
    @players.size < 2
  end

  def congrats_winner
    return false unless have_winner?

    interface.say "Game ended. Winner is #{@players.first}. \n"\
      'Congrats!'

    true
  end

  def display_bank
    interface.say "Bank contains #{@bank} dollars."
  end
end
