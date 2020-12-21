# frozen_string_literal: true

# Searches for the shortest path from A to B
class Pathfinder
  def initialize(start, goal)
    @start = start
    @goal = goal
    @parent_square = Square.new(start)
    search_goal(goal)
  end

  def search_goal(goal, parent_square = @parent_square, queue = [])
    parent_square.possible_moves(parent_square.coords).each do |move|
      return print_path(parent_square) if move == @goal

      queue << Square.new(move, parent_square)
    end
    return if queue.empty?

    search_goal(goal, queue.shift, queue)
  end

  def print_path(parent_square)
    rewind_path(parent_square)
    puts "\nOur knight went from \e[36m#{@start}\e[0m to \e[36m#{@goal}\e[0m in #{@path.size - 1} moves."
    puts 'This was the path followed:'
    @path.each { |square| p square }
    puts
  end

  def rewind_path(parent_square, path = [@goal])
    return if parent_square.nil?

    @path = path.unshift(parent_square.coords)
    rewind_path(parent_square.parent, path)
  end
end
