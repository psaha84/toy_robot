require_relative 'lib/simulator'

simulator = Simulator.new
puts "Enter command (EXIT to quit): "

loop do
  command = gets
  break if command =~ /exit/i
  simulator.execute_command(command)
end  
