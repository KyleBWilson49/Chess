require_relative "piece"
require_relative "display"

class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    place_pieces
  end


  def place_pieces
    [0,1].each do |row|
      [0,1,2,3,4,5,6,7].each do |col|
        @grid[row][col] = Piece.new (black)
      end
    end

    [6,7].each do |row|
      [0,1,2,3,4,5,6,7].each do |col|
        @grid[row][col] = Piece.new (white)
      end
    end
  end

  def move(start, end_pos)
    piece = @grid[start[0]][start[1]]
    if piece.nil? || @grid[end_pos[0]][end_pos[1]].color == piece.color
      fail "Invalid move."
    end

    @grid[start[0]][start[1]] = nil
    @grid[end_pos[0]][end_pos[1]] = piece
  end


end
