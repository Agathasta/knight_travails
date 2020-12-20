# frozen_string_literal: true

require_relative 'pathfinder.rb'
require_relative 'square.rb'

# UI: Initializes the search and shows the result
class KnightTravails
  def initialize(start, goal)
    intro
    @start = get_coords('START')
    @goal = get_coords('END')
    Pathfinder.new(@start, @goal)
  end

  private

  def intro
    puts `clear`
    puts "\n*** KNIGHT TRAVAILS ***"
    puts "\nA knight can reach from a given square in the chessboard all other squares."
    puts 'We will calculate the minimum moves needed to go from square START to square END'
    puts 'and list the squares used to get there.'
    puts "\nA chessboard has 64 squares. That means that for each square,"
    puts "coordinates x and y range from 1 to 8."
    puts "Write coordinates in a 'x, y' form."
    puts "For example, write 1,8 for the coordinates of the upper right corner.\n"
  end

  def get_coords(str)
    loop do
      @coords = ask_coords(str) 
      break if correct_coord?(@coords)
    end
    @coords
  end
  
  def ask_coords(str)
    puts "\nEnter #{str} coordinates:"
    print '> '
    gets.chomp.split(',').map(&:to_i)
  end

  def correct_coord?(coords)
    coords.size == 2 && coords.all? { |c| (1..8).include?(c) }
  end
end

KnightTravails.new([1, 2], [5, 1])
