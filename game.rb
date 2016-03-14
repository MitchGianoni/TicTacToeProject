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
		stringlocation = convert_computer_pick(location)

		until valid_choice?(stringlocation) && space_taken?(board, stringlocation)
			puts "Nope. Please enter a valid location [0-8]:"
			location = rand(0..8)
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

	def game_over?(board)
		if win?(board) || out_of_turns?(board) 
			return true 
		else
			return false	
		end
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

	def out_of_turns?(board)
		if board[:zero] != " " && board[:one] != " " && board[:two] != " " &&
			board[:three] != " " && board[:four] != " " && board[:five] != " " &&
			board[:six] != " " && board[:seven] != " " && board[:eight] != " "
				return true
		else 
				return false
		end 
	end

	def win?(board)
		if board[:zero] == board[:one] && board[:one] == board[:two] && board[:zero] != " "
			return true
		elsif board[:three] == board[:four] && board[:four] == board[:five] && board[:three] != " "
			return true
		elsif board[:six] == board[:seven] && board[:seven] == board[:eight] && board[:six] != " "
			return true
		elsif board[:zero] == board[:three] && board[:three] == board[:six] && board[:zero] != " "
			return true
		elsif board[:one] == board[:four] && board[:four] == board[:seven] && board[:one] != " "
			return true
		elsif board[:two] == board[:five] && board[:five] == board[:eight] && board[:two] != " "
			return true
		elsif board[:zero] == board[:four] && board[:four] == board[:eight] && board[:zero] != " "
			return true
		elsif board[:two] == board[:four] && board[:four] == board[:six] && board[:two] != " "
			return true
		else 
			return false
		end
	end

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
