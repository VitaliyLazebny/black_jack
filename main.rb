require_relative 'structures/game'

require_relative 'structures/card'
require_relative 'structures/cardset'
require_relative 'structures/pot'

require_relative 'structures/actor'
require_relative 'structures/dealer'
require_relative 'structures/player'


dealer_cards = Cardset.new('dealer')
gamer_cards  = Cardset.new(username)

dealer_cards.receive(trump.give(2))
gamer_cards.receive(trump.give(2))

puts "Dealer have 2 cards. You can't see them."
puts "You have: #{gamer_cards}. It's #{gamer_cards.points} total."

