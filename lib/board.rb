
class Board

  attr_accessor :cells

  def initialize(board = nil)
    @cells = board || Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    cell = input.to_i
    cell -= 1
    @cells[cell]
  end

  def full?
    @cells.all?{ |e| e == "X" || e == "O"}
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(cell)
    index = cell.to_i
    index -= 1
    @cells[index] != " " && @cells[index] != ""
  end

  def valid_move?(cell)
    index = cell.to_i
    index.between?(1,9) && !(taken?(index))
  end

  def update(index, player)
    cell = index.to_i
    cell -= 1
    play = player.token
    @cells[cell] = play
  end
end
