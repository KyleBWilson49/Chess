require_relative "piece"

class Pawn < Piece

  attr_reader :value

  def initialize(color, position, board)
    @value = "P "
    super
  end


  def moves
    valid_moves = []
    grid = @board.grid
    x,y = position

    pawn_moves = [[0,1]]
    pawn_attacks = [[1,1],[-1,1]]

    if (y == 1 && color == :black) || (y == 6 && color == :white)
      pawn_moves << [0,2]
    end

    pawn_moves.each do |move|
      dx, dy = move
      dy *= -1 if color == :white
      space = [x + dx, y + dy]
      if @board.in_bounds?(space)
        if grid[space[0]][space[1]].nil?
          valid_moves << space
        end
      end
    end

    # pawn_attacks.each do |move|
    #   dx, dy = move
    #   dy *= -1 if color == :white
    #   space = [x + dx, y + dy]
    #   if @board.in_bounds?(space) && grid[space[0]][space[1]].color != self.color
    #     valid_moves << space
    #   end
    # end
    p valid_moves
    valid_moves
  end
end
