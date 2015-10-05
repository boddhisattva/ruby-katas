describe Traveller do

  describe "#initialize" do
    context "Given a traveller instance" do
      it "should set their location and path" do
        location = Location.new(1,2,'N')
        direction = Direction.new("LMLMM")
        traveller = Traveller.new(location, direction)
        expect(location.x).to eq (1)
        expect(location.y).to eq (2)
        expect(location.compass_point).to eq ('N')
        expect(direction.moves).to eq (["L","M","L","M","M"])
      end

    end
  end

  describe "#traverse" do
    before :each do

      height = 5
      width = 5

      default_x_coordinate = RectangularPlateau::DEFAULT_X_COORDINATE
      default_y_coordinate = RectangularPlateau::DEFAULT_Y_COORDINATE

      coordinates = { :lower_left => Location.new(default_x_coordinate, default_y_coordinate),
                      :lower_right => Location.new(width, default_y_coordinate),
                      :upper_left => Location.new(default_x_coordinate, height),
                      :upper_right => Location.new(width, height)}

      @area = RectangularPlateau.new(width, height, coordinates)

    end

    context "given a set of coordinates and a traversal path" do
      context "traveller travels within area of travel"  do
        it "should get the final position wrt after the entire traversal" do

          loc2 = Location.new(3,3,"E")
          direction2 = Direction.new('MMRMMRMRRM')
          traveller2 = Traveller.new(loc2, direction2)

          traveller2.traverse(@area)

          expect(traveller2.location.x).to eq(5)
          expect(traveller2.location.y).to eq(1)
          expect(traveller2.location.compass_point).to eq("E")

        end
      end

      context "traveller goes outside area of travel"  do

        context "traversal goes outward of upper right x coordinate limit of the area" do
          it "should raise an error with an appropriate error message" do

              loc2 = Location.new(3,3,"E")
              direction2 = Direction.new('MMMRMMRMRRM')
              traveller2 = Traveller.new(loc2, direction2)

              expect(lambda {traveller2.traverse(@area)}).to raise_error("Movement is going out of specified area limits along X axis")

          end
        end

        context "traversal goes outward of upper right y coordinate limit of the area" do
          it "should raise an error with an appropriate error message" do

              loc2 = Location.new(3,3,"E")
              direction2 = Direction.new('MMRRRMMMRMRRM')
              traveller2 = Traveller.new(loc2, direction2)

              expect(lambda {traveller2.traverse(@area)}).to raise_error("Movement is going out of specified area limits along Y axis")

          end
        end

        context "traversal goes outward of lower left x coordinate limit of the area" do
          it "should raise an error with an appropriate error message" do

              loc2 = Location.new(3,3,"W")
              direction2 = Direction.new('MMMMRMMRMRRM')
              traveller2 = Traveller.new(loc2, direction2)

              expect(lambda {traveller2.traverse(@area)}).to raise_error("Movement is going out of specified area limits along -X axis")

          end
        end

        context "traversal goes outward of lower left y coordinate limit of the area" do
          it "should raise an error with an appropriate error message" do

              loc2 = Location.new(3,3,"E")
              direction2 = Direction.new('MMRMMMMRMRRM')
              traveller2 = Traveller.new(loc2, direction2)

              expect(lambda {traveller2.traverse(@area)}).to raise_error("Movement is going out of specified area limits along -Y axis")

          end
        end

      end

    end
  end


end