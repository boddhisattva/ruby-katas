require_relative "north.rb"
require_relative "south.rb"
require_relative "east.rb"
require_relative "west.rb"
class Traveller
  LEFT = "L".freeze
  RIGHT = "R".freeze
  FORWARD = "M".freeze
  NORTH = "N".freeze
  SOUTH = "S".freeze
  EAST = "E".freeze
  WEST = "W".freeze

  X_AXIS_UNIT = 1
  Y_AXIS_UNIT = 1

  attr_reader :path
  attr_accessor :location

  def initialize(location, path)
    @location = location
    @path = path
  end

  def traverse(area)
    path_moves.each_with_index do |move, _index|
      if current_move_is_to_go_forward?(move)
        move_forward_based_on_travelers_current_facing_direction(area)
      else
        change_direction_by_right_angles(move)
      end
    end
  end

  private

  def path_moves
    path.moves
  end

  def current_move_is_to_go_forward?(move)
    move == FORWARD
  end

  def move_forward_based_on_travelers_current_facing_direction(area)
    case location.compass_point
    when NORTH then move_upward_along_the_y_axis(area)
    when SOUTH then move_downward_along_the_y_axis(area)
    when EAST then move_rightward_along_the_x_axis(area)
    when WEST then move_leftward_along_the_x_axis(area)
    end
  end

  def move_downward_along_the_y_axis(area)
    if area.movement_within_south_limit?(location.y)
      location.y -= Y_AXIS_UNIT
    else
      raise "Movement is going out of specified area limits along -Y axis"
    end
  end

  def move_upward_along_the_y_axis(area)
    if area.movement_within_north_limit?(location.y)
      location.y += Y_AXIS_UNIT
    else
      raise "Movement is going out of specified area limits along Y axis"
    end
  end

  def move_rightward_along_the_x_axis(area)
    if area.movement_within_east_limit?(location.x)
      location.x += X_AXIS_UNIT
    else
      raise "Movement is going out of specified area limits along X axis"
    end
  end

  def move_leftward_along_the_x_axis(area)
    if area.movement_within_west_limit?(location.x)
      location.x -= X_AXIS_UNIT
    else
      raise "Movement is going out of specified area limits along -X axis"
    end
  end

  def change_direction_by_right_angles(move)
    cardinal_direction = get_cardinal_direction
    location.compass_point = if move == LEFT
                               cardinal_direction.left
                             elsif move == RIGHT
                               cardinal_direction.right
                             end
  end

  def get_cardinal_direction
    case location.compass_point
    when NORTH then North.new
    when SOUTH then South.new
    when EAST then East.new
    when WEST then West.new
    end
  end
end
