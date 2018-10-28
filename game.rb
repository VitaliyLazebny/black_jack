# frozen_string_literal: true

class Game
  attr_reader :player
  attr_reader :dealer
  attr_reader :bank_money
  attr_reader :deck

  # Game contains Played, Dealer, money and deck
  def initialize
    @player     = Player.new
    @dealer     = Dealer.new
    @deck       = Deck.new
    @bank_money = 0
  end

  #
  def start_round
    take_money
    discart_cards
    turn_cards
  end

  # At start of a round players are
  # putting money into 'bank'
  def take_money
    @bank_money += @player.bet + @dealer.bet
  end

  # Change cards: deck, each actor
  def discart_cards
    @deck.generate_set
    @dealer.discart_cards
    @player.discart_cards
  end

  # each actor gets 2 cards at start of round
  def turn_cards
    @dealer.take_cards(@deck.give 2)
    @player.take_cards(@deck.give 2)
  end

  #  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
  # Those 1 + 3 methods represent options
  # user can choose:
  # 1. Skip the step
  # 2. Open cards
  # 3. Get Card
  def execute(action)
    send action
  end

  def skip_step
    return if @dealer.points > 16

    @dealer.take_cards(@deck.give(1))
  end

  def open_cards; end

  def get_card
    @player.take_cards(@deck.give(1))
  end
  #  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -

  # Each round has it's own winner
  def round_winner
    return if @player.overheat? && @dealer.overheat?
    return if @player.points    == @dealer.points

    return :player if @dealer.overheat?
    return :dealer if @player.overheat?

    return :player if @player.points > @dealer.points

    :dealer
  end

  # Winner get's the bank
  def award_winner
    case round_winner
    when :player
      @player.pick_up_winnings @bank_money
    when :dealer
      @dealer.pick_up_winnings @bank_money
    else
      @player.pick_up_winnings @bank_money/2
      @dealer.pick_up_winnings @bank_money/2
    end

    @bank_money = 0
  end
end
