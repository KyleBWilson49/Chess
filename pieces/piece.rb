class Piece
  attr_reader :color, :value, :board
  attr_accessor :position

  def initialize(color, position, board)
    @color = color
    @position = position
    @board = board
  end


end
