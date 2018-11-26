class Robot
  attr_reader :position

  def initialize
  end

  def placed(position)
    @position = position
  end

  def get_position
    position.get_output 
  end

  def move(table)
    x = position.pos_x
    y = position.pos_y
    orientation = position.orientation

    case orientation
      when 'NORTH'
        x += 1
      when 'SOUTH'
        x -= 1
      when 'WEST'
        y +=  1
      when 'EAST'
        y -= 1
    end

    new_position = Position.new(x, y, orientation)
    @position = new_position if table.is_valid_position?(new_position)
  end 

  def left
    x = position.pos_x
    y = position.pos_y
    orientation = position.get_new_orientation("left")
    @position = Position.new(x, y, orientation)
  end

  def right
    x = position.pos_x
    y = position.pos_y
    orientation = position.get_new_orientation("right")
    @position = Position.new(x, y, orientation)
  end 
end
