require 'pry'

require './board'
require './game'
require './player'

player1 = Player.new
player2 = Player.new
game = Game.new

more = game.play_again?

while more 
	board = Board.new
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
			choice = game.human_take_turn(currentplayer)
		elsif currentplayer[:type] == "computer"
			choice = game.computer_take_turn(currentplayer)		
		end

		until board.legal_move?(choice) 
			if currentplayer[:type] == "human"
				print "#{currentplayer[:name]} the spot is taken, look at the board and please pick again: \n"
				board.draw_board
				choice = game.human_take_turn(currentplayer)
			elsif currentplayer[:type] == "computer"
				print "Computer is clueless and will pick again: \n"
				board.draw_board
				sleep 0.5
				choice = game.computer_take_turn(currentplayer)		
			end
		end


		board.move(currentplayer, choice)
		board.draw_board
		currentplayer, otherplayer = otherplayer,currentplayer

	end


	if board.win?
		print otherplayer[:name], " wins! \n"
		print "\n"
	elsif board.out_of_turns? == true
		print "Nobody wins \n"
		print "\n"
	end
		


		#VALIDATE MOVE
		#PLACE PIECE OR ASK AGAIN

	more = game.play_again?
end