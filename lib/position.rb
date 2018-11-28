class Position
  ORIENTATIONS = %w(NORTH WEST SOUTH EAST).freeze
  attr_reader :pos_x, :pos_y, :orientation, :table, :errors
  
  def initialize(table, x, y, orientation)
    @errors = []
    @table = table
    @orientation = orientation
    @pos_x = x.to_i
    @pos_y = y.to_i
  end

  def get_output
    [pos_x, pos_y, orientation].join(",")
  end  

  def get_new_orientation(dir)
    index = ORIENTATIONS.index(orientation)
    
    if dir == "left"
      index += 1
    else
      index -= 1
    end  

    ORIENTATIONS[index % 4]
  end

  def valid?
    @errors << "Orientation must be present" if orientation.nil?
    
    if !orientation.nil? && !ORIENTATIONS.include?(orientation)
      @errors << "Orientation is not a valid"
    end
      
    unless pos_x >= 0 && pos_y >= 0 && pos_x < table.row && pos_y < table.column
      @errors << "Position is not in table." 
    end
    
    @errors.empty?
  end
end  
