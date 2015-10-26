class RectangularPlateau
  DEFAULT_Y_COORDINATE = 0
  DEFAULT_X_COORDINATE = 0

  attr_reader :width, :height, :coordinates

  def initialize(width, height, coordinates)
    @width = width
    @height = height
    @coordinates = coordinates
  end

  def movement_within_south_limit?(y_coordinate_location)
    y_coordinate_location > coordinates[:lower_left].y
  end

  def movement_within_north_limit?(y_coordinate_location)
    y_coordinate_location < coordinates[:upper_right].y
  end

  def movement_within_east_limit?(x_coordinate_location)
    x_coordinate_location < coordinates[:upper_right].x
  end

  def movement_within_west_limit?(x_coordinate_location)
    x_coordinate_location > coordinates[:lower_left].x
  end
end
