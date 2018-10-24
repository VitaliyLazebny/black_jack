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
    @game.start_round

    puts "Dealer have #{@game.dealer_points} points."
    puts "You have #{@game.player_points} points."

    puts "You can:"
    puts "1. Get one more card."
    puts "2. Open cards."
    puts "3. Skip your step."
    i = gets.chomp.to_i
    action = [:get_card, :open_cards, :skip_step][i]
    @game.player(action)


  end
end