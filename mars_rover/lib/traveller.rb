require_relative 'north.rb'
require_relative 'south.rb'
require_relative 'east.rb'
require_relative 'west.rb'
class Traveller

  LEFT = 'L'
  RIGHT = 'R'

  X_AXIS_UNIT = 1
  Y_AXIS_UNIT = 1

  attr_reader :path
  attr_accessor :location

  def initialize(location, path)
    @location = location
    @path = path
  end

  def traverse(area)
    path_moves.each_with_index do |move, index|
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
    move == 'M'
  end

  def move_forward_based_on_travelers_current_facing_direction(area)
    case location.compass_point
      when 'N' ; move_upward_along_the_y_axis(area);
      when 'S' ; move_downward_along_the_y_axis(area);
      when 'E' ; move_rightward_along_the_x_axis(area);
      when 'W' ; move_leftward_along_the_x_axis(area);
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
    direction = case location.compass_point
      when 'N' ; North.new;
      when 'S' ; South.new;
      when 'E' ; East.new;
      when 'W' ; West.new;
    end
  end

end