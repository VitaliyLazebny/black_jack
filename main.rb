# frozen_string_literal: true
require_relative 'structures/interfacetext'

require_relative 'structures/game'

require_relative 'structures/card'
require_relative 'structures/cardset'

require_relative 'structures/actor'
require_relative 'structures/dealer'
require_relative 'structures/player'

# round number
i    = 0

interface = InterfaceText.new
interface.say "Round number #{i += 1}" while interface.game.play
