class Direction

  MOVES = {"L" => "Left", "R" => "Right", "M" => "Forward"}

  attr_accessor :moves

  def initialize(path)
    @moves = set_moves_on_successful_validation(path)
  end

  private

  def set_moves_on_successful_validation(path)
    path = split_path_into_individual_moves(path)

    unless movement_path_valid?(path)
      raise "Move specified as part of the path is an invalid one"
    end

    path
  end

  def movement_path_valid?(path)
    path.all?{|each_move| MOVES.keys.include?(each_move)}
  end

  def split_path_into_individual_moves(path)
    path.split(//)
  end

end