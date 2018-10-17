class Dealer < Actor
  def make_a_move
    case
    when @cards.points > 17
      puts "#{self}. Do nothing."
    when @cards.points <= 17
      take_card
    end
  end

  def display_cards
    puts "#{self}. Don't want to show cards."
  end
end
