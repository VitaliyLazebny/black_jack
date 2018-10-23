# frozen_string_literal: true
require_relative 'structures/interfacetext'

require_relative 'structures/game'

require_relative 'structures/card'
require_relative 'structures/cardset'

require_relative 'structures/actor'
require_relative 'structures/dealer'
require_relative 'structures/player'

interface = InterfaceText.new
interface.start_game
