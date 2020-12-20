# frozen_string_literal: true

class Path
  def initialize(start, goal)
    @start = start
    @goal = goal
    @root = Square.new(@start)
  end

  def search_goal(root = @root, queue = [])
    p root.possible_moves(root.coords)
    root.possible_moves(root.coords).each do |move|
      return puts 'Found' if move == @goal # make square and return

      queue << Square.new(move, root)
    end
    return if queue.empty?
    search_goal(queue.shift, queue)
  end
end

class Square
  attr_accessor :coords, :parent

  def initialize(coords, parent = nil)
    @coords = coords
    @parent = parent
  end

  def possible_moves(coords)
    knight_moves = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
    knight_moves.map { |move| [coords[0] + move[0], coords[1] + move[1]] }
                .keep_if { |move| move.all? {|c| (0..7).include?(c) }}
  end
end

path = Path.new([1,2], [5,4])
path.search_goal