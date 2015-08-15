class Traveller

  CARDINAL_DIRECTIONS = {"N" => {"L" => 'W', "R" => 'E'}, "E" => {"L" => 'N', "R" => 'S'},
  "W" => {"L" => 'S', "R" => 'N'}, "S" => {"L" => 'E', "R" => 'W'} }

  X_AXIS_UNIT = 1
  Y_AXIS_UNIT = 1

  attr_reader :path
  attr_accessor :location

  def initialize(location, path)
    @location = location
    @path = path
  end

  def traverse(area)
    path_moves.each_with_index do | move, index |
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
    if currently_facing_direction_is?('S')
      move_downward_along_the_y_axis(area)
    elsif currently_facing_direction_is?('N')
      move_upward_along_the_y_axis(area)
    elsif currently_facing_direction_is?('E')
      move_rightward_along_the_x_axis(area)
    elsif currently_facing_direction_is?('W')
      move_leftward_along_the_x_axis(area)
    end
  end

  def currently_facing_direction_is?(direction)
    location.compass_point == direction
  end

  def move_downward_along_the_y_axis(area)
    if location.y <= area.coordinates[:lower_left].y
      raise "Movement is going out of specified area limits along -Y axis"
    end
    location.y = location.y - Y_AXIS_UNIT
  end

  def move_upward_along_the_y_axis(area)
    if location.y >= area.coordinates[:upper_right].y
      raise "Movement is going out of specified area limits along Y axis"
    end
    location.y = location.y + Y_AXIS_UNIT
  end

  def move_rightward_along_the_x_axis(area)
    if location.x >= area.coordinates[:upper_right].x
      raise "Movement is going out of specified area limits along X axis"
    end
    location.x = location.x + X_AXIS_UNIT
  end

  def move_leftward_along_the_x_axis(area)
    if location.x <= area.coordinates[:lower_left].x
      raise "Movement is going out of specified area limits along -X axis"
    end
    location.x = location.x - X_AXIS_UNIT
  end

  def change_direction_by_right_angles(move)
    location.compass_point = CARDINAL_DIRECTIONS[location.compass_point][move]
  end

end