# frozen_string_literal: true

require_relative 'interface'
require_relative 'game'

require_relative 'actors/actor'
require_relative 'actors/dealer'
require_relative 'actors/player'

require_relative 'cards/card'
require_relative 'cards/cardset'
require_relative 'cards/deck'
require_relative 'cards/hand'

game = Game.new
Interface.new(game)
