#Clase que controla el movimiento del jugador por el laberinto

require 'pry'
require_relative 'RoomMazeClasses.rb'
require_relative 'DialogClasses.rb'
require_relative 'ObjectClasses.rb'

class Console
	include NextRoom
	include ItemActions

	def play maze 
		#bucle del juego que se ejecuta cada vez que el jugador pulsa alguna
		#tecla
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
		#Mensajes iniciales del juego
		puts "Press N/S/E/W to move around the maze."
		puts "If you are stuck at some point, you can always cry for HELP"
		puts "Good luck"
	end

	def move room, user_action, maze
		#Controla qué hacer con el input del usuario por pantalla.
		#Puede hacer tres cosas: Moverse (NSEW), recoger un item (Pick up nombre_item),
		#tirar un item (Drop nombre_item), y más cosas que de momento no he hecho.
		#binding.pry
		if ["N", "S", "E", "W"].include? user_action
			move_on room, user_action
		else
			if ["Pick", "Drop", "List"].include? user_action.split.first
				item_interaction user_action, room
				room
			else
				#aquí tengo que meter las demás cosas que puede hacer el jugador:
				#pedir ayuda, ver mapa (esto sería la leche), etc.
				puts "I' m afraid you cannot do that"
				room
			end
		end
	end
end


