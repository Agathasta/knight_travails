# class Board**
#   init a 'board'
#   define allowed_moves for 'move' (in board limits)

# class Knight**
#   init start_coords
#   define 'knight_moves'
#   define moves from start_coords: 'possible_moves' and 'allowed_moves'

# class Node
#   init: coords & parent

# class Path
#   init: found boolean, found_node, steps, start
#   def path_to:  add Node.new(start) to children / queue []
#                 check if child is goal, if not move to queue
#                 from queue as parent node push children as Node.new to children
#   def found:  path = [], until found_node.parent.nil? push found_node.parent to path,
#               make found_node = found_node.parent
#               print path

# game = Board.new
# alex = Knight.new([2,2])
# alex.knight_moves([7,2])
