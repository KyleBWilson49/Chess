require_relative "board"
require_relative "cursorable"
require_relative "display"
require_relative "pieces"

class Game
  attr_reader :display, :board

  def initialize
    @board = Board.new
    @display = Display.new(@board)
  end

  def play
    @display.render
    begin
      from_position = get_move
      to_position = get_move
      @board.move(from_position, to_position)
    rescue RuntimeError => e
      puts e.message
      puts "Try again!"
      retry
    end

    # result = @display.get_input
    until game_over?
      play
    end
  end

  def game_over?
    false
  end

  def get_move
    result = nil
    until result
      @display.render
      result = @display.get_input
    end

    until result.is_a?(Array)
      get_move
    end
    result
  end
end

g = Game.new
g.play
