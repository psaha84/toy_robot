require_relative 'table'
require_relative 'robot'
require_relative 'position'

class Simulator
  attr_reader :table, :robot

  def initialize
    @table = Table.new
    @robot = Robot.new(table)
  end

  def execute_command(command)
    if command =~ /place/i
      command, x, y, orientation = command.gsub(',', ' ').split
      position = Position.new(table, x, y, orientation)
      
      if position.valid?
        robot.placed(position)
      else
        puts position.errors.join(", ") + ". Please enter valid position"
      end        
    elsif command =~ /move/i || command =~ /left/i || command =~ /right/i || command =~ /report/i
      if robot.placed?
        if command =~ /move/i
          robot.move
        elsif command =~ /left/i
          robot.left
        elsif command =~ /right/i
          robot.right
        elsif command =~ /report/i
          puts robot.get_position
        end  
      else
        puts "Place the robot first"   
      end
    else
      puts "Unknown command"
    end      
  end        
end
