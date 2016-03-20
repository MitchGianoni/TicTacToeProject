 require 'pry'

require './board'
require './game'
require './player'

player1 = Player.new
player2 = Player.new
game = Game.new
board  = Board.new

more = game.play_again?

while more
	game.greeting

	name1 = player1.choose_players(1)
	name2 = player2.choose_players(2)

	puts
	print name1[:name], " is a ", name1[:type], " as ", name1[:piece], "\n"
	print " vs. ", "\n"
	print name2[:name], " is a ", name2[:type], " as ", name2[:piece], "\n"
	puts
	game.instructions
	board.draw_board
	
	currentplayer = game.coinflip(name1,name2)
	
	if currentplayer == name1
		otherplayer = name2
	else
		otherplayer = name1
	end

	until board.game_over?

		if currentplayer[:type] == "human"
			choice = game.human_take_turn(currentplayer, board)
		elsif currentplayer[:type] == "computer"
			choice = game.computer_take_turn(currentplayer, board)
		end

		# Need a way to update the board
		# Need a way to ask the board if a move is legal

		if choice == "0"
			# maybe like this? board.move(currentplayer[:piece], location)
			board[:zero] = currentplayer[:piece]
		elsif choice == "1"
			board[:one] = currentplayer[:piece]
		elsif choice == "2"
			board[:two] = currentplayer[:piece]
		elsif choice == "3"
			board[:three] = currentplayer[:piece]
		elsif choice == "4"
			board[:four] = currentplayer[:piece]
		elsif choice == "5"
			board[:five] = currentplayer[:piece]
		elsif choice == "6"
			board[:six] = currentplayer[:piece]
		elsif choice == "7" 
			board[:seven] = currentplayer[:piece]
		elsif choice == "8"
			board[:eight] = currentplayer[:piece]
		end

		board.draw_board
		currentplayer, otherplayer = otherplayer,currentplayer
	end

	print otherplayer[:name], " wins!!!!! \n"

	more = game.play_again?
end
