# frozen_string_literal: true

require_relative 'interface'
require_relative 'game'

require_relative 'actor'
require_relative 'dealer'
require_relative 'player'

require_relative 'card'
require_relative 'cardset'
require_relative 'deck'
require_relative 'hand'

game = Game.new
Interface.new(game)
