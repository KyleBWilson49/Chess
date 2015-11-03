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
    super(KING_MOVES)
  end


end
