class Direction
  MOVES = { "L" => "Left", "R" => "Right", "M" => "Forward" }.freeze

  attr_accessor :moves

  def initialize(path)
    path = split_path_into_individual_moves(path)
    @moves = path if movement_path_valid?(path)
  end

  private

  def movement_path_valid?(path)
    if path.all? { |each_move| MOVES.keys.include?(each_move) }
      return true
    else
      raise "Move specified as part of the path is an invalid one"
    end
  end

  def split_path_into_individual_moves(path)
    path.split(//)
  end
end
