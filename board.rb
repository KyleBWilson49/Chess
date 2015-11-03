require_relative "display"
require_relative "humanplayer"

class Board
  attr_reader :grid

  def initialize(populate_pieces = true)
    @grid = Array.new(8) { Array.new(8) }
    place_pieces if populate_pieces
  end

  def place_pieces
    @grid[0][0] = Rook.new(:black, [0,0], self)
    @grid[0][7] = Rook.new(:black, [0,7], self)
    @grid[7][0] = Rook.new(:white, [7,0], self)
    @grid[7][7] = Rook.new(:white, [7,7], self)

    @grid[0][2] = Bishop.new(:black, [0,2], self)
    @grid[0][5] = Bishop.new(:black, [0,5], self)
    @grid[7][2] = Bishop.new(:white, [7,2], self)
    @grid[7][5] = Bishop.new(:white, [7,5], self)

    @grid[0][3] = Queen.new(:black, [0,3], self)
    @grid[7][3] = Queen.new(:white,[7,3], self)

    @grid[0][4] = King.new(:black, [0,4], self)
    @grid[7][4] = King.new(:white, [7,4], self)

    @grid[0][1] = Knight.new(:black, [0,1], self)
    @grid[0][6] = Knight.new(:black, [0,6], self)
    @grid[7][1] = Knight.new(:white, [7,1], self)
    @grid[7][6] = Knight.new(:white, [7,6], self)

    (0..7).each do |col|
      @grid[1][col] = Pawn.new(:black, [1,col], self)
    end

    (0..7).each do |col|
      @grid[6][col] = Pawn.new(:white, [6,col], self)
    end
  end

  def move(start, end_pos, current_player)
    piece = @grid[start[0]][start[1]]

    if piece.nil? || piece.color != current_player.color
      fail "Invalid move."
    end

    end_piece = @grid[end_pos[0]][end_pos[1]]
    unless end_piece.nil?
      if end_piece.color == piece.color
        fail "Invalid move"
      end
    end

    if piece.valid_moves.include?(end_pos)
      @grid[start[0]][start[1]] = nil
      @grid[end_pos[0]][end_pos[1]] = piece
      piece.position = [end_pos[0], end_pos[1]]
    else
      fail "Invalid move"
    end
  end

  def move!(start, end_pos)
    piece = @grid[start[0]][start[1]]

    @grid[start[0]][start[1]] = nil
    @grid[end_pos[0]][end_pos[1]] = piece
    piece.position = [end_pos[0], end_pos[1]]
  end

  def in_bounds?(pos)
    pos.all? {|el| el.between?(0,7)}
  end

  def in_check?(color)
    king = @grid.flatten.select do |piece|
      !piece.nil? && piece.color == color && piece.class == King
    end
    enemy_pieces = @grid.flatten.select {|piece| !piece.nil? && piece.color != color}

    enemy_pieces.any? do |piece|
      piece.moves.include?(king[0].position)
    end
  end

  def checkmate?(color)
    own_pieces = @grid.flatten.select {|piece| !piece.nil? && piece.color == color}

    own_pieces.all? {|piece| piece.valid_moves.empty?}
  end

  def fake_board
    fake_board = Board.new(false)
    (0..7).each do |row|
      (0..7).each do |col|
        unless self.grid[row][col].nil?
          fake_board.grid[row][col] = self.grid[row][col].dup_piece(fake_board)
        end
      end
    end
    fake_board
  end
end
