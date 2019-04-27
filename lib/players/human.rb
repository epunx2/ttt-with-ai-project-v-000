module Players
  class Human < Player
    def move(board)
      puts "Please enter a cell to move your token to"
      input = gets
    end
  end
end
