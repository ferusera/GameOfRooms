require_relative 'RoomMazeClasses.rb'
require_relative 'ObjectClasses.rb'

module NextRoom

	def move_on room, direction
		if room.exits[direction]
			new_room = get_room room.exits[direction]
		else
			room
		end
	end

end


module ItemActions

	def item_interaction action

		if action.split[0] == "Pick"
			pick_up_item action.split[3]
		elsif action.split[0] == "Drop"
			drop_item action.split[2]
		else
			puts list_available_items  #no sé cómo cojones hacer para que esta función
		end							   #que pertenece a la clase Inventory
									   #pueda ser utiliada aquí.
	end

	def pick_up_item item

		if list_available_items.include? item
			puts "Sorry, keep trying"
		else
			add_item item
			puts "#{item.name} safely stored"
		end	
	end

	def drop_item item
		if item.list_available_items.include? item
			puts "No item to drop"
		else
			item.retreive_item item
			puts "Bye bye #{item.name}"
		end
	end

end





