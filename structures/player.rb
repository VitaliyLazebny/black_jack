class Player < Actor
  def name
    unless @name
      puts "Please enter your name:"
      @name = gets.chomp
      puts
    end

    @name
  end
end
