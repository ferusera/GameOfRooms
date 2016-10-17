#Estos módulos los hice para controlar todos los mensajes que se muestran
#por pantalla pero dependen demasiado del resto y no consigo que funcione 
#bien, sobre todo ItemActions

require_relative 'RoomMazeClasses.rb'
require_relative 'ItemClasses.rb'

module NextRoom
	#Este módulo sí que funcion. Simplemente indica a qué habitación pasa el 
	#usuario tras haber introducido N,S,E,W.

	def move_on room, direction
		if room.exits[direction]
			new_room = get_room room.exits[direction]
		else
			room
		end
	end

end


module ItemActions
	#Esta es la que no funciona. Hay funciones que están definidas dentro de la
	#clase Inventory y que no sé cómo hacer para acceder a ellas desde aquí.

	def item_interaction action, room

		if action.split[0] == "Pick"
			pick_up_item action.split[3], room
		elsif action.split[0] == "Drop"
			drop_item action.split[2], room
		else
			puts list_available_items  
		end							   
									   
	end

	def pick_up_item item_name

		if list_available_items.include? item_name
			add_item item_name #aquí es donde no sé cómo llamar a la función
								#add_item que pertenece a la clase Inventory
			room.delete_item get_item item_name #me pasa lo mismo que con add_item

			#falta comprobar que no lo tiene ya. Si lo tiene ya, peta.
			puts "#{item_name} safely stored"
		else
			puts "Sorry, keep trying"
		end	
	end

	def drop_item item_name, room

		if list_available_items.include? item_name
			retreive_item item_name #me pasa lo mismo que con add_item
			room.add_item get_item item_name
			puts "Bye bye #{item_name}"
		else
			puts "No item to drop"
		end

	end

end





