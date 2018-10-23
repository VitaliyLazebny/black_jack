# frozen_string_literal: true

# Game defines rules and sequencing
class InterfaceText
  attr_reader :game

  def initialize
    @game = Game.new(self)
  end

  def start_game
    i = 0

    while interface.game.execute_current_step do
      say "Round number #{i += 1}"
    end
  end

  def say(text)
    puts text
  end

  def ask
    gets.chomp
  end
end
