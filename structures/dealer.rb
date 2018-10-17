class Dealer < Actor
  # def name
  #   'dealer'
  # end

  def make_a_move
    case
    when @cards.points > 17
      puts "#{self}. Do nothing."
    when @cards.points <= 17
      take_card
    end
  end
end
