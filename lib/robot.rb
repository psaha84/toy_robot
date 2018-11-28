class Robot
  attr_reader :position, :table

  def initialize(table)
    @table = table
  end

  def placed(position)
    @position = position
  end

  def get_position
    position.get_output 
  end

  def move
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

    set_position(x, y, orientation)
  end 

  def left
    orientation = position.get_new_orientation("left")
    set_position(position.pos_x, position.pos_y, orientation)
  end

  def right
    orientation = position.get_new_orientation("right")
    set_position(position.pos_x, position.pos_y, orientation)
  end 

  def placed?
    !!position
  end

  private

  def set_position(x, y, orientation)
    new_position = Position.new(table, x, y, orientation)
    @position = new_position if new_position.valid?
  end
end
