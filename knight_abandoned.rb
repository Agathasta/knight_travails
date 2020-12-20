class Path
  attr_accessor :children

  def initialize(start, goal)
    @start = start
    @goal = goal
    @children = [Node.new(start)]
  end

  def search_goal(coords = @start, queue = [])
    make_children(coords)
    children.each do |child|
      # return reverse_path(child) if child.coords == @goal
      return p child if child.coords == @goal

      queue << child.coords 
    end
    search_goal(queue.shift, queue)
  end

  def make_children(coords)
      children << Node.new([coords[0] - 2, coords[1] - 1], self)
      children << Node.new([coords[0] - 2, coords[1] + 1], self)
      children << Node.new([coords[0] - 1, coords[1] - 2], self)
      children << Node.new([coords[0] - 1, coords[1] + 2], self)
      children << Node.new([coords[0] + 1, coords[1] - 2], self)
      children << Node.new([coords[0] + 1, coords[1] + 2], self)
      children << Node.new([coords[0] + 2, coords[1] - 1], self)
      children << Node.new([coords[0] + 2, coords[1] + 1], self)
    children.select! { |child| child.coords.all? {|c| (0..7).include?(c) } }
  end

  def reverse_path(child, path = [])
    return if child.parent.nil?

    path << child.coords
    reverse_path(child.parent, path)
    print path
  end
end

class Node
  attr_accessor :coords, :parent

  def initialize(coords, parent = nil)
    @coords = coords
    @parent = parent
  end
end

knight = Path.new([0,0], [7,7])
knight.search_goal
