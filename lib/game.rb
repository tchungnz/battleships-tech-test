require_relative 'player'
require_relative 'board'
require_relative 'ship'

class Game

attr_reader :board, :player
DIRECTIONS = [:up, :down, :left, :right]
BOARD_SIZE = 10

  def initialize(board = Board.new, player = Player.new)
    @board = board
    @player = player
  end

  def place_ship(ship, x_coordinate, y_coordinate, direction)
    raise "Not a valid coordinate" if x_coordinate > (BOARD_SIZE - 1) || y_coordinate > (BOARD_SIZE - 1)
    raise "Not a ship" if !ship.is_a?(Ship)
    raise "Not a valid direction" if !DIRECTIONS.include? direction
    return plot_ship(ship, x_coordinate, y_coordinate, direction)
  end

  def plot_ship(ship, x_coordinate, y_coordinate, direction)
    raise "You can't place the ship there" if invalid_plot?(ship, x_coordinate, y_coordinate, direction)
    y = 0
    x = 0
    ship.size.times do |add_ship|
      @board.boardArray[x_coordinate + x][y_coordinate + y] = ship.type
      direction == :right ? y += 1 : y
      direction == :left ? y -= 1 : y
      direction == :down ? x += 1 : x
      direction == :up ? x -= 1 : x
    end
    return @board.boardArray
  end

  def invalid_plot?(ship, x_coordinate, y_coordinate, direction)
    if direction == :right
      (x_coordinate + ship.size) > (BOARD_SIZE - 1)
    elsif direction == :left
      (x_coordinate - ship.size) < 0
    elsif direction == :down
      (y_coordinate + ship.size) > (BOARD_SIZE - 1)
    elsif direction == :up
      (y_coordinate - ship.size) < 0
    end
  end

end
