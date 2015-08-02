require './journey.rb'

class Adventure
end

location1 = Location.new(1,2,'N')
location2 = Location.new(3,3,'E')

direction2 = Direction.new("MMRMMRMRRM")
direction1 = Direction.new("LMLMLMLMM")

traveller1 = Traveller.new(location1 , direction1)
traveller2 = Traveller.new(location2 , direction2)

height = 5
width = 5

default_x_coordinate = RectangularPlateau::DEFAULT_X_COORDINATE
default_y_coordinate = RectangularPlateau::DEFAULT_Y_COORDINATE

coordinates = { :lower_left => Location.new(default_x_coordinate, default_y_coordinate),
                :lower_right => Location.new(width, default_y_coordinate),
                :upper_left => Location.new(default_x_coordinate, height),
                :upper_right => Location.new(width, height)}

journey = Journey.new(
  RectangularPlateau.new(width,height,coordinates),
  Travellers.new([traveller1, traveller2]))

journey.travel
journey.get_destination_position