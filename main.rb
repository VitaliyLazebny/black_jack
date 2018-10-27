# frozen_string_literal: true

require_relative 'interface'
require_relative 'deck'
require_relative 'game'

game = Game.new
Interface.new(game)
