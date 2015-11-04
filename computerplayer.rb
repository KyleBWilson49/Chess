require_relative 'display'
require_relative 'cursorable'
require_relative 'board'
require 'byebug'

class ComputerPlayer
  attr_reader :color

  def initialize(color, board)
    @color = color
    @board = board
    @has_selected = nil
  end

  def play_turn
    # debugger
    moves_hash = available_moves
    if @has_selected == nil
      possible_pieces = moves_hash.select { |key, val| !val.empty? }
      @has_selected = possible_pieces.keys.sample
    else
      new_move = moves_hash[@has_selected].sample
      @has_selected = nil
      new_move
    end

  end

  def available_moves
    pieces = @board.grid.flatten.select { |piece| !piece.nil? && piece.color == @color }
    moves_hash = Hash.new { |h,k| h[k] = [] }
    pieces.each do |piece|
      moves_hash[piece.position] = piece.valid_moves
    end
    moves_hash
  end

end
