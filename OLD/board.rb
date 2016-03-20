require 'pry'

class Board
	## 3 things we need to do:
	#
	## 1) be able to check game over
	## 2) be able to update the @spaces with a move
	## 3) player needs to "see" the @spaces

	def initialize
		@spaces = {
			zero: 0, one: 1, two: 2, 
			three: 3, four: 4, five: 5, 
			six: 6, seven: 7, eight: 8
		}
	end

	# TODO: Define this so you can fixup game.rb methods for
	# computer_take_turn and human_take_turn.
	# Ideally, you could say in those methods board.available_space?(7)
	def available_space?(location)

	end

	## TODO: Correctly define place to update board for a player at given location.
	## Update tic-tac-toe.rb to use this instead of accessors.
	def place(player, location)
		@spaces[location] = player.piece
	end

	def draw_board
		print "\n"
		print @spaces[:zero], " | ", @spaces[:one], " | ", @spaces[:two], "\n"
		print "---------", "\n"
		print @spaces[:three], " | ", @spaces[:four], " | ", @spaces[:five], "\n"
		print "---------", "\n"
		print @spaces[:six], " | ", @spaces[:seven], " | ", @spaces[:eight], "\n"
		print "\n"
	end

	def game_over?
		if win? || out_of_turns? 
			return true 
		else
			return false	
		end
	end

	def out_of_turns?
		@spaces.values.all? { |x| x.is_a?(String) }
	end

	def win?
		if @spaces[:zero] == @spaces[:one] && @spaces[:one] == @spaces[:two] && @spaces[:zero] != " "
			return true
		elsif @spaces[:three] == @spaces[:four] && @spaces[:four] == @spaces[:five] && @spaces[:three] != " "
			return true
		elsif @spaces[:six] == @spaces[:seven] && @spaces[:seven] == @spaces[:eight] && @spaces[:six] != " "
			return true
		elsif @spaces[:zero] == @spaces[:three] && @spaces[:three] == @spaces[:six] && @spaces[:zero] != " "
			return true
		elsif @spaces[:one] == @spaces[:four] && @spaces[:four] == @spaces[:seven] && @spaces[:one] != " "
			return true
		elsif @spaces[:two] == @spaces[:five] && @spaces[:five] == @spaces[:eight] && @spaces[:two] != " "
			return true
		elsif @spaces[:zero] == @spaces[:four] && @spaces[:four] == @spaces[:eight] && @spaces[:zero] != " "
			return true
		elsif @spaces[:two] == @spaces[:four] && @spaces[:four] == @spaces[:six] && @spaces[:two] != " "
			return true
		else 
			return false
		end
	end



end 
