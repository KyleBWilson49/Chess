require_relative "stepping_pieces"

class King < SteppingPiece

  attr_reader :value

  def initialize(color, position, board)
    @value = "♚ " if color == :black
    @value = "♔ " if color == :white
    super
  end

  KING_MOVES = [[1,1],[-1,-1],[-1,1],[1,-1],[1,0],[-1,0],[0,1],[0,-1]]

  def moves
    valid_moves = []
    grid = @board.grid
    x,y = position
    # debugger
    KING_MOVES.each do |move|
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
