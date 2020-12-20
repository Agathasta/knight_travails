# frozen_string_literal: true

# Defines possible squares (children) as needed
class Square
  attr_accessor :coords, :parent

  def initialize(coords, parent = nil)
    @coords = coords
    @parent = parent
  end

  def possible_moves(coords)
    knight_moves = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
    knight_moves.map { |move| [coords[0] + move[0], coords[1] + move[1]] }
                .keep_if { |move| move.all? { |c| (0..7).include?(c) } }
  end
end
