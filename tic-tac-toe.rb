require 'pry'

require './board'
require './game'
require './player'

class TicTacToe

	player1 = Player.new
	player2 = Player.new
	game = Game.new
	board  = Board.new

	defaultboard =	{
		zero: "0", one: "1", two: "2", 
		three: "3", four: "4", five: "5", 
		six: "6", seven: "7", eight: "8"
					}
	more = game.play_again?

	while more
		game.greeting

		name1 = player1.choose_players(1)
		name2 = player2.choose_players(2)

		gameboard = 	{
			zero: " ", one: " ", two: " ", 
			three: " ", four: " ", five: " ",
			six: " ", seven: " ", eight: " "
						}

		puts
		print name1[:name], " is a ", name1[:type], " as ", name1[:piece], "\n"
		print " vs. ", "\n"
		print name2[:name], " is a ", name2[:type], " as ", name2[:piece], "\n"
		puts
		game.instructions
		board.draw_board(defaultboard)
		
		currentplayer = game.coinflip(name1,name2)
		
		if currentplayer == name1
			otherplayer = name2
		else
			otherplayer = name1
		end

		until game.game_over?(gameboard)

			if currentplayer[:type] == "human"
				choice = game.human_take_turn(currentplayer, gameboard)
			elsif currentplayer[:type] == "computer"
				choice = game.computer_take_turn(currentplayer, gameboard)
			end

			if choice == "0"
				gameboard[:zero] = currentplayer[:piece]
			elsif choice == "1"
				gameboard[:one] = currentplayer[:piece]
			elsif choice == "2"
				gameboard[:two] = currentplayer[:piece]
			elsif choice == "3"
				gameboard[:three] = currentplayer[:piece]
			elsif choice == "4"
				gameboard[:four] = currentplayer[:piece]
			elsif choice == "5"
				gameboard[:five] = currentplayer[:piece]
			elsif choice == "6"
				gameboard[:six] = currentplayer[:piece]
			elsif choice == "7" 
				gameboard[:seven] = currentplayer[:piece]
			elsif choice == "8"
				gameboard[:eight] = currentplayer[:piece]
			end

			board.draw_board(gameboard)
			currentplayer, otherplayer = otherplayer,currentplayer
		end
		
		# mitch = {zero: "0", one: "1", two: "2", three: "3", four: "4",
		#			five: "5", six: "6", seven: "7", eight: "8"}
		# puts board.draw_board(mitch)

		more = game.play_again?
	end

#designate piece
#take turn
#judge wins


end