describe RectangularPlateau do
  before :each do
    @width = 4
    @height = 5
    default_x_coordinate = RectangularPlateau::DEFAULT_X_COORDINATE
    default_y_coordinate = RectangularPlateau::DEFAULT_Y_COORDINATE
    coordinates = { :lower_left => Location.new(default_x_coordinate, default_y_coordinate),
                    :lower_right => Location.new(@width, default_y_coordinate),
                    :upper_left => Location.new(default_x_coordinate, @height),
                    :upper_right => Location.new(@width, @height)}
    @rectangular_plateau = RectangularPlateau.new(@width, @height, coordinates)
  end

  describe "#initialize" do
    context "Given an instance of a Rectangle" do
      it "should set the appropriate height, width and coordiantes" do
        expect(@rectangular_plateau.width).to eq (@width)
        expect(@rectangular_plateau.height).to eq (@height)
        expect(@rectangular_plateau.coordinates[:upper_right].x).to eq(@width)
        expect(@rectangular_plateau.coordinates[:upper_right].y).to eq(@height)
      end
    end
  end

  describe "#movement_within_south_limit?" do
    context "given a traveller is traveling downwards in the southern direction" do
      context "the travel is within the specified area" do
        it "should return true" do
          expect(@rectangular_plateau.movement_within_south_limit?(2)).to be true
        end
      end

      context "the travel is outside the specified area" do
        it "should return false" do
          expect(@rectangular_plateau.movement_within_south_limit?(0)).to be false
        end
      end
    end
  end

  describe "#movement_within_north_limit?" do
    context "given a traveller is traveling upwards in the northern direction" do
      context "the travel is within the specified area" do
        it "should return true" do
          expect(@rectangular_plateau.movement_within_north_limit?(4)).to be true
        end
      end

      context "the travel is outside the specified area" do
        it "should return false" do
          expect(@rectangular_plateau.movement_within_north_limit?(6)).to be false
        end
      end
    end
  end

  describe "#movement_within_east_limit?" do
    context "given a traveller is traveling rightwards in the eastern direction" do
      context "the travel is within the specified area" do
        it "should return true" do
          expect(@rectangular_plateau.movement_within_east_limit?(3)).to be true
        end
      end

      context "the travel is outside the specified area" do
        it "should return false" do
          expect(@rectangular_plateau.movement_within_east_limit?(6)).to be false
        end
      end
    end
  end

  describe "#movement_within_west_limit?" do
    context "given a traveller is traveling leftwards in the western direction" do
      context "the travel is within the specified area" do
        it "should return true" do
          expect(@rectangular_plateau.movement_within_west_limit?(1)).to be true
        end
      end

      context "the travel is outside the specified area" do
        it "should return false" do
          expect(@rectangular_plateau.movement_within_west_limit?(0)).to be false
        end
      end
    end
  end
end
