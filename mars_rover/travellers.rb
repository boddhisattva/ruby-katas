class Travellers
  attr_accessor :traveller

  def initialize(traveller = [])
    @traveller = traveller
  end

  def travel(area)
    self.traveller.each do |traveller|
      traveller.traverse(area)
    end
  end

end