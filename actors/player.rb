# frozen_string_literal: true

# Human player class.
# To make move used users input.
class Player < Actor
  # Player can see his own points
  def points_string
    points.to_s
  end
end
