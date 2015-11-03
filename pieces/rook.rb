require_relative "sliding_pieces"

class Rook < SlidingPiece

  attr_reader :value

  def initialize(color, position, board)
    @value = "♖ " if color == :white
    @value = "♜ " if color == :black
    super
  end

  ROOK_MOVES = [[1,0],[-1,0],[0,1],[0,-1]]

  def moves
    super(ROOK_MOVES)
  end

end
