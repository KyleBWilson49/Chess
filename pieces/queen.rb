require_relative "sliding_pieces"

class Queen < SlidingPiece

  attr_reader :value

  def initialize(color, position, board)
    @value = "♕ " if color == :white
    @value = "♛ " if color == :black
    super
  end

  QUEEN_MOVES = [[1,1],[-1,-1],[-1,1],[1,-1],[1,0],[-1,0],[0,1],[0,-1]]

  def moves
    valid_moves = []
    grid = @board.grid
    x,y = position
    # debugger
    QUEEN_MOVES.each do |move|
      dx, dy = move
      space = [x + dx, y + dy]
      while @board.in_bounds?(space)
        if grid[space[0]][space[1]].nil?
          valid_moves << space
          space = [space[0] + dx, space[1] + dy]
        elsif grid[space[0]][space[1]].color == self.color
          break
        elsif grid[space[0]][space[1]].color != self.color
          valid_moves << space
          break
        end
      end
    end
    valid_moves
  end


end
