describe Journey do
  before :each do

    location1 = Location.new(1,2,'N')
    location2 = Location.new(3,3,'E')

    path1 = "LMLMLMLMM"

    path2 = "MMRMMRMRRM"

    traveller1 = Traveller.new(location1 , path1)

    traveller2 = Traveller.new(location2 , path2)

    height = 5
    width = 5

    default_x_coordinate = RectangularPlateau::DEFAULT_X_COORDINATE
    default_y_coordinate = RectangularPlateau::DEFAULT_Y_COORDINATE

    coordinates = { :lower_left => Location.new(default_x_coordinate, default_y_coordinate),
                    :lower_right => Location.new(width, default_y_coordinate),
                    :upper_left => Location.new(default_x_coordinate, height),
                    :upper_right => Location.new(width, height)}

    @journey = Journey.new(
      RectangularPlateau.new(width, height, coordinates),
      Travellers.new([traveller1, traveller2]))

  end

  describe "#initialize" do
    context "Given an instance of a Journey" do
      it "should be composed of travellers and a plateau area to journey around" do
        expect(@journey.area).to be_an(RectangularPlateau)
        expect(@journey.travellers).to be_an(Travellers)
      end
    end
  end

    describe "#travel" do
      context "Given an instance of a Journey" do
        it "the travel should be based on a path leading to a final and accurate destination position" do
          @journey.travel

          expect(@journey.travellers.traveller.first.location.x).to eq(1)
          expect(@journey.travellers.traveller.first.location.y).to eq(3)
          expect(@journey.travellers.traveller.first.location.compass_point).to eq("N")

          expect(@journey.travellers.traveller.last.location.x).to eq(5)
          expect(@journey.travellers.traveller.last.location.y).to eq(1)
          expect(@journey.travellers.traveller.last.location.compass_point).to eq("E")

        end
      end
    end

    describe "#get_destination_position" do
      context "Given travellers have journeyed through an area" do
        it "should display the final destination position for each of these travellers" do
          @journey.travel
          journey_output = "1 3 N\n5 1 E\n"
          expect {@journey.get_destination_position}.to output(journey_output).to_stdout    
        end
      end
    end

end