# frozen_string_literal: true

require_relative 'pathfinder.rb'
require_relative 'square.rb'

# Initializes the search and prints the result
class Path
  def initialize(start, goal)
    @start = start
    @goal = goal
    Pathfinder.new(start, goal, self)
  end

  def print_path(parent_square)
    rewind_path(parent_square)
    puts "\nWent from #{@start} to #{@goal} in #{@path.size - 1} moves."
    puts 'This was the path followed:'
    @path.each { |square| p square }
  end

  def rewind_path(parent_square, path = [@goal])
    return if parent_square.nil?

    @path = path.unshift(parent_square.coords)
    rewind_path(parent_square.parent, path)
  end
end

Path.new([0, 0], [7, 7])
