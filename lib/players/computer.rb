module Players
  class Computer < Player
    def move(board_object)
      board = board_object
      count = board.turn_count
      case count
      when 0
        move = 5
      when 1
        if board.valid_move?(5)
          move = 5
        else
          move = 2
        end
      when 2
        if board.valid_move?(1)
          move = 1
        else
          move = 3
        end
      when 3
        if board.@cells[1] == "O"
          move = 1
        end
      when 4
        if board.@cells[1] == "X"
          if board.valid_move?(9)
            move = 9
          else
            move = 2
          end
        elsif board.@cells[3] == "X"
          if board.valid_move?(7)
            move = 7
          else
            move = 2
          end
        else
          move = 4
        end

      else
        move = rand(1..9)
      end
      move.to_s
    end
  end
end
