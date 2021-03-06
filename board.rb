require 'pry'

class Board

	def initialize
		@spaces = {
			zero: 0, one: 1, two: 2,
			three: 3, four: 4, five: 5,
			six: 6, seven: 7, eight: 8
		}
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

	def legal_move?(location)
		if location == 0
			return @spaces[:zero].is_a?(Fixnum)
		elsif location == 1
			return @spaces[:one].is_a?(Fixnum)
		elsif location == 2
			return @spaces[:two].is_a?(Fixnum)
		elsif location == 3
			return @spaces[:three].is_a?(Fixnum)
		elsif location == 4
			return @spaces[:four].is_a?(Fixnum)
		elsif location == 5
			return @spaces[:five].is_a?(Fixnum)
		elsif location == 6
			return @spaces[:six].is_a?(Fixnum)
		elsif location == 7
			return @spaces[:seven].is_a?(Fixnum)
		elsif location == 8
			return @spaces[:eight].is_a?(Fixnum)
		else 
			return false
		end	
	end

	def move(currentplayer, choice)
		if choice == 0
			@spaces[:zero] = currentplayer[:piece]
		elsif choice == 1
			@spaces[:one] = currentplayer[:piece]
		elsif choice == 2
			@spaces[:two] = currentplayer[:piece]
		elsif choice == 3
			@spaces[:three] = currentplayer[:piece]
		elsif choice == 4
			@spaces[:four] = currentplayer[:piece]
		elsif choice == 5
			@spaces[:five] = currentplayer[:piece]
		elsif choice == 6
			@spaces[:six] = currentplayer[:piece]
		elsif choice == 7
			@spaces[:seven] = currentplayer[:piece]
		elsif choice == 8
			@spaces[:eight] = currentplayer[:piece]
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