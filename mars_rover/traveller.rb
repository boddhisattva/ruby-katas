class Traveller

  MOVES = {"L" => "Left", "R" => "Right", "M" => "Forward"}

  CARDINAL_DIRECTIONS = {"N" => {"L" => 'W', "R" => 'E'}, "E" => {"L" => 'N', "R" => 'S'}, 
  "W" => {"L" => 'S', "R" => 'N'}, "S" => {"L" => 'E', "R" => 'W'} }

  attr_reader :path
  attr_accessor :location

  def initialize(location, path)
    @location = location
    @path = validate_and_split_path(path)
  end

  def traverse(area)
    path.each_with_index do | move, index |
      if current_move_is_to_go_forward?(move)
        move_forward_in_your_current_facing_direction_by_a_unit(area)
      else
        change_direction_by_right_angles_if_current_move_is_left_or_right(move)
      end
    end
  end

  private

  def validate_and_split_path(path)
    path = split_path_into_individual_moves(path)
    raise "Improper movement path provided to the traveller" unless movement_path_valid?(path)
    path
  end

  def split_path_into_individual_moves(path)
    path.split(//)
  end

  def movement_path_valid?(path)
    path.all?{|each_move| MOVES.keys.include?(each_move)}
  end

  def current_move_is_to_go_forward?(move)
    move == 'M'
  end

  def move_forward_in_your_current_facing_direction_by_a_unit(area)
    if currently_facing_south?
      move_downwards_along_the_y_axis(area)
    elsif currently_facing_north?
      move_upwards_along_the_y_axis(area)
    elsif currently_facing_east?
      move_rightward_along_the_x_axis(area)
    elsif currently_facing_west?
      move_leftward_along_the_x_axis(area)
    end
  end

  def currently_facing_south?
    location.compass_point == 'S'
  end

  def currently_facing_north?
    location.compass_point == 'N'
  end

  def currently_facing_east?
    location.compass_point == 'E'
  end

  def currently_facing_west?
    location.compass_point == 'W'
  end

  def move_downwards_along_the_y_axis(area)
    if location.y <= area.coordinates[:lower_left].y
      raise "Movement is going out of specified area limits along -Y axis" 
    end
    location.y = location.y - 1
  end

  def move_upwards_along_the_y_axis(area)
    if location.y >= area.coordinates[:upper_right].y
      raise "Movement is going out of specified area limits along Y axis" 
    end
    location.y = location.y + 1
  end

  def move_rightward_along_the_x_axis(area)
    if location.x >= area.coordinates[:upper_right].x
      raise "Movement is going out of specified area limits along X axis"
    end
    location.x = location.x + 1
  end

  def move_leftward_along_the_x_axis(area)
    if location.x <= area.coordinates[:lower_left].x
      raise "Movement is going out of specified area limits along -X axis"
    end
    location.x = location.x - 1
  end

  def change_direction_by_right_angles_if_current_move_is_left_or_right(move)
    location.compass_point = CARDINAL_DIRECTIONS[location.compass_point][move]
  end

end