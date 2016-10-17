require 'pry'
require_relative 'RoomMazeClasses.rb'
require_relative 'DialogClasses.rb'
require_relative 'ObjectClasses.rb'

class Console
	include NextRoom
	include ItemActions

	def play maze
		start_game
		goal = false
		room = maze.get_room(1)
		while goal == false do
			puts ">"
			user_action = gets.chomp
			binding.pry
			room = move(room, user_action, maze)
			puts "#{room.description}"
			puts room.list_items
			goal = true if room.id == maze.last_room
		end
	end

	def start_game
		puts "Press N/S/E/W to move around the maze."
		puts "If you are stuck at some point, you can always cry for HELP"
		puts "Good luck"
	end

	def move room, user_action, maze
		#binding.pry
		if ["N", "S", "E", "W"].include? user_action
			move_on room, user_action
		else
			if ["Pick", "Drop", "List"].include? user_action.split.first
				item_interaction user_action
				room
			else
				puts "I' m afraid you cannot do that"
				room
			end
		end
	end
end


