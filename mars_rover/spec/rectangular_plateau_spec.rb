describe RectangularPlateau do
  describe "#initialize" do
    context "Given an instance of a Rectangle" do
      it "should set the appropriate height, width and coordiantes" do
        width = 4
        height = 5

        default_x_coordinate = RectangularPlateau::DEFAULT_X_COORDINATE
        default_y_coordinate = RectangularPlateau::DEFAULT_Y_COORDINATE

        coordinates = { :lower_left => Location.new(default_x_coordinate, default_y_coordinate),
                        :lower_right => Location.new(width, default_y_coordinate),
                        :upper_left => Location.new(default_x_coordinate, height),
                        :upper_right => Location.new(width, height)}        

        rect = RectangularPlateau.new(width, height, coordinates)
        expect(rect.width).to eq (width)
        expect(rect.height).to eq (height)
        expect(rect.coordinates[:upper_right].x).to eq(width)
        expect(rect.coordinates[:upper_right].y).to eq(height)
      end
    end
  end

end
