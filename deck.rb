# frozen_string_literal: true

module Deck
  SUITS = { Diamond: "\u25C6",
            Spade:   "\u2660",
            Club:    "\u2663",
            Heart:   "\u2665" }.freeze

  NAMES = [2, 3, 4, 5, 6, 7, 8, 9,
           'Jack',
           'Queen',
           'Кing',
           'Ace'].freeze

  def points(player)
    points = 0


    instance_variable_get("@#{player}_cards").each do |c|
      card_name = c[0].to_i
      points += if c[0].to_i.zero?
                  10
                elsif c[0] == 'A'
                  11
                else
                  card_name
                end
    end

    points
  end

  # @return Array of Strings
  def generate_cardset
    @cards = []

    NAMES.each do |n|
      SUITS.each do |s|
        @cards.push "#{n} #{s}"
      end
    end
  end

  def reset_cards
    @player_cards = []
    @dealer_cards = []
  end

  def turn_cards
    for_player = @cards.sample 2
    @cards.delete for_player
    @player_cards += for_player

    for_dealer = @cards.sample 2
    @cards.delete for_dealer
    @dealer_cards += for_dealer
  end

  def get_card
    for_player = @cards.sample 1
    @cards.delete for_player
    @player_cards += for_player
  end

  def open_cards; end
end
