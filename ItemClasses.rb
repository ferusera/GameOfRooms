#Estas clases son las relaciondas con los items que el jugador se va encontrando
#por las habitaciones.

class Inventory
	#Inventario de todos los items

	def initialize
		@item_list = {}
		@available_items = {}
	end

	def add_available_item item
		#El hash @available_items tiene todos los items disponibles en el juego.
		#A partir de ahí, se puede escoger cuáles se van a dejar en la habitaciones
		#para que se los encuentre el usuario y cuáles no.
		@available_items[item.name] = item
	end

	def list_available_items
		@available_items.keys
	end

	def add_item item_name
		#Añade un item al inventario del jugador. Se llama a esta función cuando
		#el jugador se encuentra un objeto y decide recogerlo.
		@item_list[item_name] = @available_items[item_name]
	end

	def retreive_item item_to_retreive
		#Elimina el item del inventario del jugador. Se llama a esta función
		#cada vez que el usuario tira un objeto.
		@item_list.delete_if{|item_name, item| item_to_retreive.name == item_name}
	end

	def list_inventory
		#Muestra todos los items del inventario del jugador
		@item_list.keys
	end

	def get_item item_name
		#Permite, con el nombre de un item, obtener el objeto item.
		@available_items[item_name]
	end

end

class Item < Inventory
	#Clase que define los items. Por ahora tienen un nombre y una descripción.
	attr_reader :name :description
	def initialize name
		@name = name
		@description = ""
	end

	def add_description item_description
		@description = item_description
	end

	def show_description
		@description
	end
end



