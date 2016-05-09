class Board
  attr_reader :grid

  def initialize(grid = Array.new(3) { Array.new(3) })
    @grid = grid
  end

  def value(pos)
    row, col = pos
    @grid[row][col]
  end

  def place_mark(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def empty?(pos)
    row, col = pos
    @grid[row][col].nil?
  end

  def over?
    return true if winner != nil || @grid.flatten.all? { |pos| !pos.nil? }
    return false if @grid.flatten.any? { |pos| pos.nil? }
  end

  def winner
    (rows + cols + diags).each do |triple|
      return :X if triple == [:X, :X, :X]
      return :O if triple == [:O, :O, :O]
    end
    nil
  end

  def rows
    rows = []
    @grid.each { |row| rows << row }
    rows
  end

  def cols
    cols = []
    @grid.each { |row| cols << row }
    cols.transpose
  end

  def diags
    left_diag = [@grid[0][0], @grid[1][1], @grid[2][2]]
    right_diag = [@grid[0][2], @grid[1][1], @grid[2][0]]
    diag = [left_diag, right_diag]
  end
end
