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
    puts(<<~INTRO)
      \n\e[47m*** KNIGHT TRAVAILS ***\e[0m
      \nA chessboard has 64 squares. 
      That means that for each square,
      coordinates x and y range from 1 to 8.
      Write coordinates in a 'x, y' form.
      \e[37m(v.gr. 8,1 for the coordinates of the upper right corner)\e[0m\n
    INTRO
  end

  def get_coords(str)
    loop do
      @coords = ask_coords(str) 
      break if correct_coord?(@coords)
    end
    @coords
  end
  
  def ask_coords(str)
    puts "\nEnter \e[36m#{str}\e[0m coordinates:"
    print '> '
    gets.chomp.split(',').map(&:to_i)
  end

  def correct_coord?(coords)
    coords.size == 2 && coords.all? { |c| (1..8).include?(c) }
  end
end

KnightTravails.new([1, 2], [5, 1])
