#aquí es dónde doy valores a todos los objetos del juego (habitaciones,
#items, laberinto, etc.)

require_relative 'RoomMazeClasses.rb'
require_relative 'Console.rb'
require_relative 'ItemClasses.rb'

maze = Maze.new
forest = Room.new({"N" => false, "S" => false, "E" => 2, "W" => false}, \
					"You are in a forest", 1)
castle = Room.new({"N" => false, "S" => false, "E" => 3, "W" => 1}, \
					"You are in a castle", 2)
jungle = Room.new({"N" => false, "S" => 4, "E" => false, "W" => 2}, \
					"You are in a jungle", 3)
beach = Room.new({"N" => 3, "S" => false, "E" => 5, "W" => false}, \
					"You are in a beach", 4)
mountain = Room.new({"N" => false, "S" => 6, "E" => false, "W" => 4}, \
					"You are in a mountain", 5)
goal = Room.new({"N" => 5, "S" => false, "E" => false, "W" => false}, \
					"Congrats! You got out of the maze!", 6)

car = Item.new("car")
car.add_description "You found a car! You can travel far with your new car!"
plate = Item.new("plate")
plate.add_description "Oh! It's a plate! Useful if you are hungry"
chair = Item.new("chair")
chair.add_description "Unless you're tired, you don't really need this chair..."
sword = Item.new("sword")
sword.add_description "Oh yeah! A sword! Try not to loos this"

inventory = Inventory.new
inventory.add_available_item car
inventory.add_available_item plate
inventory.add_available_item chair
inventory.add_available_item sword

castle.add_item plate
forest.add_item car
beach.add_item chair
mountain.add_item sword

maze.add_room forest
maze.add_room castle
maze.add_room jungle
maze.add_room beach
maze.add_room mountain
maze.add_room goal

Console.new.play maze

