class Path
  attr_reader :root, :goal

  def initialize(start, goal)                    
    @root = start
    @goal = goal
  end

  def make_children(coords = root)
    @children = [                                                         
    Position.new([coords[0] - 2, coords[1] - 1], coords),
    Position.new([coords[0] - 2, coords[1] + 1], coords),
    Position.new([coords[0] - 1, coords[1] - 2], coords),
    Position.new([coords[0] - 1, coords[1] + 2], coords),
    Position.new([coords[0] + 1, coords[1] - 2], coords),
    Position.new([coords[0] + 1, coords[1] + 2], coords),
    Position.new([coords[0] + 2, coords[1] - 1], coords),
    Position.new([coords[0] + 2, coords[1] + 1], coords)
    ]
    @children.select! { |child| child.coords.all? {|c| (0..7).include?(c) } }
  end

  def search_destination(coords = root, queue = [])
    make_children(coords)
    @children.each do |child|
      # return path(child) if child.coords == goal
      return puts "#{child.coords} FOUND!!" if child.coords == goal
      queue << child.coords
    end
    search_destination(queue.shift, queue)
    return if queue.empty?
  end

  # def path(child)
  #   print child.parent
  #   return if child.parent.nil?
  #   path(child.parent)
  # end
end

class Position
  attr_accessor :coords, :parent

  def initialize(coords, parent = nil)                    
    @coords = coords
    @parent = parent
  end
end


knight = Path.new([0,0], [2,5])
# p knight.coords
# p knight.make_children([2,6])
knight.search_destination
