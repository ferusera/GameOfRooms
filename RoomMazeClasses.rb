#require 'pry'
class Room
	attr_reader :exits, :description, :id
	def initialize exits, description, id
		@exits = exits
		@description = description
		@id = id
		@items = []
	end

	def show_exits
		exit_list = @exits.select {|k, v| v != false}
		exit_list = exit_list.keys
	end

	def add_item item
		@items << item
	end

	def delete_item item_to_delete
		@items.delete_if{|item| item_to_delete.name == item.name}
	end

	def list_items
		@items.reduce([]){|memo, item| memo << item.show_description}
	end
end

class Maze
	def initialize
		@rooms = []
	end

	def add_room room
		@rooms << room
	end

	def get_room room_id
		@rooms[room_id - 1]
	end

	def last_room
		@rooms[-1].id
	end
end


class User
	def initialize name
		@name = name
	end

	def position
	end
end

