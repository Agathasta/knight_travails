# frozen_string_literal: true

# Searches for the shortest path from A to B
class Pathfinder
  def initialize(start, goal, path)
    @goal = goal
    @path = path
    @parent_square = Square.new(start)
    search_goal(goal)
  end

  def search_goal(goal, parent_square = @parent_square, queue = [])
    parent_square.possible_moves(parent_square.coords).each do |move|
      return @path.print_path(parent_square) if move == @goal

      queue << Square.new(move, parent_square)
    end
    return if queue.empty?

    search_goal(goal, queue.shift, queue)
  end
end
