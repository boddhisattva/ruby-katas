require_relative './lib/location.rb'
require_relative './lib/traveller.rb'
require_relative './lib/rectangular_plateau.rb'
require_relative './lib/direction.rb'

# PROJECT_ROOT = File.expand_path("../../", __FILE__)

# Dir.glob(File.join(PROJECT_ROOT, "lib", "*.rb")).each do |file|
#   require file
# end

traveller1_current_location = Location.new(1, 2, 'N')
traveller2_current_location = Location.new(3, 3, 'E')

direction1 = Direction.new("LMLMLMLMM")
direction2 = Direction.new("MMRMMRMRRM")

traveller1 = Traveller.new(traveller1_current_location, direction1)
traveller2 = Traveller.new(traveller2_current_location, direction2)

height = 5
width = 5

default_x_coordinate = RectangularPlateau::DEFAULT_X_COORDINATE
default_y_coordinate = RectangularPlateau::DEFAULT_Y_COORDINATE

coordinates = { :lower_left => Location.new(default_x_coordinate, default_y_coordinate),
                :lower_right => Location.new(width, default_y_coordinate),
                :upper_left => Location.new(default_x_coordinate, height),
                :upper_right => Location.new(width, height) }

traveller1.traverse(RectangularPlateau.new(width, height, coordinates))
puts traveller1.location.x.to_s + " " + traveller1.location.y.to_s + " " + traveller1.location.compass_point

traveller2.traverse(RectangularPlateau.new(width, height, coordinates))
puts traveller2.location.x.to_s + " " + traveller2.location.y.to_s + " " + traveller2.location.compass_point