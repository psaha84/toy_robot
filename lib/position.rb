class Position
  ORIENTATIONS = %w(NORTH WEST SOUTH EAST).freeze
  attr_reader :pos_x, :pos_y, :orientation
  
  def initialize(x, y, orientation)
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
end  
