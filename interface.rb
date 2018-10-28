# frozen_string_literal: true

class Interface
  def initialize(game)
    @game = game

    ask_name
    play
  end

  def ask_name
    puts "Please, enter your name:"
    name = gets.chomp
    puts "Hello #{name}"
  end

  def play
    loop do
      @game.start_round

      puts "Dealer have #{@game.dealer.points_string} points."
      puts "You have #{@game.player.points_string} points "\
           "with cards: '#{@game.player.cards}'"

      puts "You can:"
      puts "1. Get one more card."
      puts "2. Open cards."
      puts "3. Skip your step."
      i = gets.chomp.to_i
      action = [:get_card, :open_cards, :skip_step][i-1]
      @game.execute(action)

      case @game.round_winner
      when :player
        puts 'Player won the round.'
      when :dealer
        puts 'Dealer won the round.'
      else
        puts "There's no winner."
      end

      puts "Dealer's points: '#{@game.dealer.points}' "\
           "with cards: '#{@game.dealer.cards}'."
      puts 'vs'
      puts "Player's points: '#{@game.player.points}' "\
           "with cards: '#{@game.player.cards}'."
      3.times { puts }

      @game.award_winner

      break if @game.player.bankrupt?
      break if @game.dealer.bankrupt?
    end

    puts 'Game finished.'
    puts "Dealer has: $#{@game.dealer_money}"
    puts "Player has: $#{@game.player_money}"
  end
end
