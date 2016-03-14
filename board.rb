require 'pry'

class Board
	attr_accessor :zero, :one, :two, :three, :four, :five, :six, :seven, :eight

def initialize

end

def draw_board(board)
	print "\n"
	print board[:zero], " | ", board[:one], " | ", board[:two], "\n"
	print "---------", "\n"
	print board[:three], " | ", board[:four], " | ", board[:five], "\n"
	print "---------", "\n"
	print board[:six], " | ", board[:seven], " | ", board[:eight], "\n"
	print "\n"
end

end 