class RectangularPlateau

  DEFAULT_Y_COORDINATE = 0
  DEFAULT_X_COORDINATE = 0

  attr_reader :width, :height, :coordinates

  def initialize(width,height,coordinates)
    @width = width
    @height = height
    @coordinates = coordinates
  end

end