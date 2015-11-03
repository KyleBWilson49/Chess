require "colorize"
require_relative "board"
require_relative "cursorable"

class Display
  include Cursorable

  def initialize(board)
    @board = board
    @cursor_pos = [0,0]
    @cursor_last = nil
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      if piece
        color_options = colors_for(i, j, piece.color)
        piece.value.to_s.colorize(color_options)
      else
        color_options = colors_for(i, j)
        "  ".colorize(color_options)
      end
    end
  end

  def colors_for(i, j, color = :white)
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif [i, j] == @cursor_last
      bg = :light_blue
    elsif (i + j).odd?
      bg = :light_black
    else
      bg = :light_white
    end
    { background: bg, color: color }
  end

  def render
    system("clear")
    build_grid.each { |row| puts row.join }
    print "\n"
  end

end
