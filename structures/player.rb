class Player < Actor
  def name
    unless @name
      puts "Please enter your name:"
      @name = gets.chomp
      puts
    end

    @name
  end

  def make_a_move

  end
end
