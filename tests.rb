require 'minitest/autorun'
require 'pry'

require './tic-tac-toe'
require './board'
require './game'
require './player'

class TicTacTest < Minitest::Test

	def test_player_one_is_x
		
		player1 = Player.new

		test_player_1 = player1.choose_players(1)
		assert test_player_1[:piece] == "X"
	end

	def test_player_two_is_o

		player2 = Player.new

		test_player_2 = player2.choose_players(2)
		assert test_player_2[:piece] == "O"
	end

	def board_can_be_drawn

		board = Board.new

		defaultboard =	{
		zero: "0", one: "1", two: "2", 
		three: "3", four: "4", five: "5", 
		six: "6", seven: "7", eight: "8"
					}

		assert board.draw_board(defaultboard)
	end

	def is_valid_choice_1

		game = Game.new
		choice = "1"

		assert game.valid_choice?(choice)
	end

	def out_of_turns_works
		game = Gamme.new

		defaultboard =	{
		zero: "0", one: "1", two: "2", 
		three: "3", four: "4", five: "5", 
		six: "6", seven: "7", eight: "8"
					}

		assert game.out_of_turns?(defaultboard)
	end


end