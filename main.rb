require_relative 'structures/card'
require_relative 'structures/trump'
require_relative 'structures/pot'

puts "Welcome in 'Black Jack' game!"
puts
puts "Please enter your name:"
username = gets.chomp
puts

puts "Hello, #{username}."

trump = Cardset.new('trump')
trump.generate_set

money = Money.new

dealer_cards = Cardset.new('dealer')
gamer_cards  = Cardset.new(username)

dealer_cards.receive(trump.give(2))
gamer_cards.receive(trump.give(2))

puts "Dealer have 2 cards. You can't see them."
puts "You have: #{gamer_cards}. It's #{gamer_cards.points} total."

