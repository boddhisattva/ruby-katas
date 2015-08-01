require './location.rb'
require './traveller.rb'
require './travellers.rb'
require './rectangular_plateau.rb'

class Journey
  
  attr_accessor :travellers, :area
  
  def initialize(area, travellers)
    @area = area
    @travellers = travellers
  end

  def travel
    travellers.travel(area)
  end

  def get_destination_position
    travellers.traveller.each do |traveller|
      puts traveller.location.x.to_s + " " + traveller.location.y.to_s + " " + traveller.location.compass_point
    end
  end

end

