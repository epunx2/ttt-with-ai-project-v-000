require_relative "players/human.rb"
class Game
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat\'s Game!"
    end
  end

  def turn
    player = current_player
    player_move = player.move(@board)
    if @board.valid_move?(player_move)
      @board.update(player_move, player)
      @board.display
    else
      turn
    end
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def computer_strategy

  end
  def draw?
    if @board.full? && !won?
      return true
    elsif won?
      return false
    elsif !won? && !@board.full?
      return false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |item|
      if @board.cells[item[0]] == "X" && @board.cells[item[1]] == "X" && @board.cells[item[2]] == "X"
        return item
      elsif @board.cells[item[0]] == "O" && @board.cells[item[1]] == "O" && @board.cells[item[2]] == "O"
        return item
      end
    end
    return false
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    winner = won?
    winner ? @board.cells[winner[0]] : nil
  end
end
