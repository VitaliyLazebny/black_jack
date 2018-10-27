# frozen_string_literal: true

class Game
  include Deck

  attr_reader :player_money,
              :dealer_money,
              :bank_money

  def initialize
    @player_money = 100
    @dealer_money = 100
    @bank_money   = 0

    generate_cardset
  end


  def start_round
    take_money
    reset_cards
    turn_cards
  end

  def take_money
    @player_money -= 10
    @dealer_money -= 10
    @bank_money   += 20
  end

  def player(action)
    send action
  end

  def skip_step
    return if points(:dealer) > 16

    for_dealer = @cards.sample 1
    @cards.delete for_dealer
    @dealer_cards += for_dealer
  end

  def round_winner
    return if points(:player) > 21 && points(:dealer) > 21
    return if points(:player)      == points(:dealer)

    return :player if points(:dealer) > 21
    return :dealer if points(:player) > 21

    return :player if points(:player) > points(:dealer)

    :dealer
  end

  def award_winner
    case round_winner
    when :player
      @player_money += @bank_money
    when :dealer
      @dealer_money += @bank_money
    else
      @player_money += @bank_money/2
      @dealer_money += @bank_money/2
    end

    @bank_money = 0
  end
end
