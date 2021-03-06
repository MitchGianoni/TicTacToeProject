require 'pry'

class Player



	def choose_players(x)
		puts "Player #{x}: Human or Computer (H/C)?"
		playertype = gets.chomp.upcase

		if x == 1
			piece = "X"
		elsif x == 2
			piece = "O"
		end

		while playertype != "H" || playertype != "C"
			if playertype == "H"
				puts "Player #{x}'s name is?"
				player = gets.chomp
				return {
					name: player, piece: piece, type: "human"
				}
			elsif playertype == "C"
				puts "Player #{x} is a computer named Computer#{x}."
				player = "Computer#{x}"
				return {
					name: player, piece: piece, type: "computer"
				}
			else
				puts "Please pick H or C"
				playertype = gets.chomp.upcase
			end
		end
	end
end