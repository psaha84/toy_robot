require_relative 'table'
require_relative 'robot'
require_relative 'position'

class Simulator
  attr_reader :table, :robot

  def initialize
    @table = Table.new
    @robot = Robot.new
  end

  def execute_command(command)
    if command =~ /place/i
      command, x, y, orientation = command.gsub(',', ' ').split
      position = Position.new(x, y, orientation)
      robot.placed(position) if table.is_valid_position?(position)
    elsif command =~ /move/i
      robot.move(table)
    elsif command =~ /left/i
      robot.left
    elsif command =~ /right/i
      robot.right
    elsif command =~ /report/i
      puts robot.get_position
    else
      "Unknown command"
    end    
  end        
end
