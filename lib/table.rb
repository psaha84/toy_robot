class Table
  attr_reader :row, :column

  def initialize(row = 5, column = 5)
    @row = row
    @column = column
  end

  def is_valid_position?(position)
    position.pos_x >= 0 && position.pos_y >= 0 && position.pos_x < row && position.pos_y < column
  end
end  
