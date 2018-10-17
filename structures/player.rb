class Player < Actor
  def initialize

    super(name)
  end

  def name
    unless @name
      puts "Please enter your name:"
      @name = gets.chomp
      puts
    end

    @name
  end

  def display_moves
    puts "Please choose move:"
    puts "1. Get a card."
    puts "2. Skip step."
    puts "3. Open cards."
  end

  def make_a_move
    display_moves

    i = gets

    case i.to_i
    when 1
      take_card
    when 2
      puts "#{self}. Do nothing."
    when 3
      puts "#{self}. Want to open cards."
    end
  end
end
