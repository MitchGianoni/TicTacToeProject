require 'pry'

class Game

	def greeting
		puts "Welcome to Tic-Tac-Toe"
	end

	def instructions
		puts "This is a new game. Board numbers are as follows:"
	end

	def coinflip(player1, player2)
		coinflip = ["Heads", "Tails"]
		who = coinflip[rand(coinflip.length)]
		if who == "Heads"
			currentplayer = player1
		else
			currentplayer = player2
		end
		return currentplayer
	end

	def play_again?
		puts
		puts "HOW ABOUT A GAME OF TIC TAC TOE? (Y/N)"
		choice = gets.chomp.downcase

		until ["y","n"].include?(choice)
			puts "Please choose 'Y' or 'N'."
			choice = gets.chomp.downcase
		end
		choice == "y"
	end

	def computer_take_turn(currentplayer,board)
		puts "#{currentplayer[:name]} the #{currentplayer[:type]} as #{currentplayer[:piece]} picks:"
		location = rand(0..8)
		print location, "\n"
		sleep 0.5
		stringlocation = convert_computer_pick(location)

		## until board.available_space?(location)
		until valid_choice?(stringlocation) && space_taken?(board, stringlocation)
			puts "Nope. #{currentplayer[:name]} will attempt to select a valid location [0-8]:"
			location = rand(0..8)
			print location, "\n"
			sleep 0.5
			stringlocation = convert_computer_pick(location)
		end

		return stringlocation
	end

	def human_take_turn(currentplayer, board)
		puts "#{currentplayer[:name]} the #{currentplayer[:type]} you are #{currentplayer[:piece]}. Please enter your desired location [0-8]:"
		location = gets.chomp
		
		until valid_choice?(location) && space_taken?(board, location)
			puts "Nope. Please enter a valid location [0-8]:"
			location = gets.chomp
		end

		return location
	end

	private

	def convert_computer_pick(location)
		if location == 0
			return "0"
		elsif location == 1
			return "1"
		elsif location == 2
			return "2"
		elsif location == 3
			return "3"
		elsif location == 4
			return "4"
		elsif location == 5
			return "5"
		elsif location == 6
			return "6"
		elsif location == 7
			return "7"
		elsif location == 8
			return "8"
		end
	end


## move to board class - need a way to say got the move from a player, is the spot taken

	def valid_choice?(location)	
		choices = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]

		if choices.include?(location)
			return true
		else
			return false
		end
	end

	def space_taken?(board, location)
		if location == "0"
			if board[:zero] == " "
				return true
			end
		elsif location == "1"
			if board[:one] == " "
				return true
			end
		elsif location == "2"
			if board[:two] == " "
				return true
			end
		elsif location == "3"
			if board[:three] == " "
				return true
			end
		elsif location == "4"
			if board[:four] == " "
				return true
			end
		elsif location == "5"
			if board[:five] == " "
				return true
			end
		elsif location == "6"
			if board[:six] == " "
				return true
			end
		elsif location == "7"
			if board[:seven] == " "
				return true
			end
		elsif location == "8"
			if board[:eight] == " "
				return true
			end
		else
			return false
		end
	end
end