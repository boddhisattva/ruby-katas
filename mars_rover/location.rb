class Location

  CARDINAL_COMPASS_POINTS = {"N" => "North", "S" => "South", "E" => "East", "W" => "West"}

  attr_accessor :x, :y, :compass_point

  def initialize(x,y,compass_point=nil)
    @x = x
    @y = y
    @compass_point = set_compass_point_on_successful_validation(compass_point) if compass_point
  end

  private

  def set_compass_point_on_successful_validation(compass_point)
    raise "Specified cardinal compass point is invalid" unless cardinal_compass_point_valid?(compass_point)
    compass_point
  end

  def cardinal_compass_point_valid?(compass_point)
    CARDINAL_COMPASS_POINTS.keys.include?(compass_point)
  end

end

