class Inventory
	def initialize
		@item_list = []
		@available_items = []
	end

	def add_available_item item
		@available_items << item
	end

	def list_available_items
		@available_items.reduce([]){|memo, item| memo << item.name}
	end

	def add_item item
		@item_list << item
	end

	def retreive_item item_to_retreive
		@item_list.delete_if{|item| item_to_retreive.name == item.name}
	end

	def list_inventory
		@item_list.reduce([]){|memo, item| memo << item.name}
	end
end

class Item < Inventory
	attr_reader :name
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



