class Piece
  attr_reader :color, :value, :board
  attr_accessor :position

  def initialize(color, position, board)
    @color = color
    @position = position
    @board = board
  end

  def dup_piece(fake_board)
    dup_color = self.color
    dup_position = self.position

    self.class.new(dup_color, dup_position, fake_board)
  end

end
