require 'pry'

class Game

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

	def greeting
		puts "Welcome to Tic-Tac-Toe"
	end

	def instructions
		puts "This is a new game. Board numbers are as follows:"
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

	def computer_take_turn(currentplayer)
		puts "#{currentplayer[:name]} the #{currentplayer[:type]} as #{currentplayer[:piece]} picks:"
		location = rand(0..8)
		print location, "\n"
		sleep 0.5
		return location
	end

	def human_take_turn(currentplayer)
		choices = ["0","1","2","3","4","5","6","7","8"]
		puts "#{currentplayer[:name]} the #{currentplayer[:type]} you are #{currentplayer[:piece]}. Please enter your desired location [0-8]:"
		location = gets.chomp

		until choices.include?(location)
			puts "Please choose a valid number [0-8]:"
			location = gets.chomp
		end
		return location.to_i
	end



end
