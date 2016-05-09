require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_reader :board, :player1, :player2, :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    player1.mark = :X
    player2.mark = :O
    @current_player = player1
    @board = Board.new
  end

  def play
    current_player.display(board)
    until board.over?
      play_turn
    end

    if board.winner == player1.mark
      puts "#{player1.name} wins!"
    elsif board.winner == player2.mark
      puts "#{player2.name} wins!"
    else
      puts "TIE GAME SON!"
    end
  end

  def play_turn
    move = current_player.get_move
    board.place_mark(move, current_player.mark)
    switch_players!
    current_player.display(board)
  end

  def switch_players!
    if current_player == player1
      @current_player = player2
    else
      @current_player = player1
    end
    @current_player
  end
end

peter = HumanPlayer.new("Peter")
jimmy = ComputerPlayer.new("Jimmy")
g = Game.new(peter, jimmy)
g.play
