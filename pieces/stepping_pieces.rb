require_relative "piece"

class SteppingPiece < Piece

  def initialize(color, position, board)
    super
  end

  def moves(move_directions)
    valid_moves = []
    grid = @board.grid
    x,y = position
    # debugger
    move_directions.each do |move|
      dx, dy = move
      space = [x + dx, y + dy]
      if @board.in_bounds?(space)
        if grid[space[0]][space[1]].nil?
          valid_moves << space
        elsif grid[space[0]][space[1]].color != self.color
          valid_moves << space
        end
      end
    end
    valid_moves
  end
end
