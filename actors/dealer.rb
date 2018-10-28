# frozen_string_literal: true

# Non human player
# Most of methods are defined at Actor class
class Dealer < Actor
  # Methods 'cards' and 'points'
  # are defined at Actor class

  # Hide for a player
  def cards_string
    '**'
  end

  # Hide for a player
  def points_string
    '**'
  end
end
