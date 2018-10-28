# frozen_string_literal: true

class Game
  attr_reader :player,
              :dealer,
              :bank_money,
              :deck

  def initialize
    @player     = Player.new
    @dealer     = Dealer.new
    @deck       = Deck.new
    @bank_money = 0
  end


  def start_round
    take_money
    discart_cards
    turn_cards
  end

  def take_money
    @bank_money += @player.bet + @dealer.bet
  end

  def discart_cards
    @deck.generate_set
    @dealer.discart_cards
    @player.discart_cards
  end

  def turn_cards
    @dealer.take_cards(@deck.give 2)
    @player.take_cards(@deck.give 2)

    puts
  end

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

  def round_winner
    return if @player.overheat? && @dealer.overheat?
    return if @player.points    == @dealer.points

    return :player if @dealer.overheat?
    return :dealer if @player.overheat?

    return :player if @player.points > @dealer.points

    :dealer
  end

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
