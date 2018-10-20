# frozen_string_literal: true

# Game defines rules and sequencing
class InterfaceText
  attr_reader :game

  def initialize
    @game = Game.new(self)
  end

  def say(text)
    puts text
  end

  def ask
    gets.chomp
  end
end
