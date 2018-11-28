class Table
  attr_reader :row, :column

  def initialize(row = 5, column = 5)
    @row = row
    @column = column
  end
end  
