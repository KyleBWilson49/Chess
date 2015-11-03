require_relative "sliding_pieces"

class Bishop < SlidingPiece

  attr_reader :value

  def initialize(color, position, board)
    @value = "B "
    super
  end

  BISHOP_MOVES = [[1,1],[-1,-1],[-1,1],[1,-1]]

  def moves
    valid_moves = []
    grid = @board.grid
    x,y = position
    # debugger
    BISHOP_MOVES.each do |move|
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
