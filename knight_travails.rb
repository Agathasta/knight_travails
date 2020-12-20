# frozen_string_literal: true

class Path
  def initialize(start, goal)
    @start = start
    @goal = goal
    @root = Square.new(@start)
    search_goal
  end

  def search_goal(root = @root, queue = [])
    root.possible_moves(root.coords).each do |move|
      return print_path(root) if move == @goal

      queue << Square.new(move, root)
    end
    return if queue.empty?

    search_goal(queue.shift, queue)
  end

  def print_path(parent)
    get_path(parent)
    puts "\nWent from #{@start} to #{@goal} in #{@path.size - 1} moves."
    puts 'This was the path followed:'
    @path.each { |square| p square }
  end

  def get_path(parent, path = [@goal])
    return if parent.nil?

    @path = path.unshift(parent.coords)
    get_path(parent.parent, path)
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

Path.new([0,0], [7,7])
