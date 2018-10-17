require_relative 'structures/game'

require_relative 'structures/card'
require_relative 'structures/cardset'
require_relative 'structures/pot'

require_relative 'structures/actor'
require_relative 'structures/dealer'
require_relative 'structures/player'

i = 0

game = Game.new
while game.play do
  puts i = i + 1
end
