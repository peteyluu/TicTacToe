class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    moves = []
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        if board.empty?(pos)
          moves << pos
        end
      end
    end

    moves.each do |move|
      return move if wins?(move)
    end

    moves.sample
  end

  def wins?(move)
    board.place_mark(move, mark)

    if board.winner == mark
      board.place_mark(move, nil)
      return true
    else
      board.place_mark(move, nil)
      return false
    end
  end
end
