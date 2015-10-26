describe Location do
  describe "#initialize" do
    context "Given a location instance" do
      it "should set the default location coordinates and compass_point" do
        location = Location.new(1, 2, "N")

        expect(location.x).to eq (1)
        expect(location.y).to eq (2)
        expect(location.compass_point).to eq ("N")
      end

      context "the location instance has an incorrect cardinal point" do
        it "should raise an error with an appropriate error message" do
          expect { Location.new(1, 2, "U") }.to raise_error("Specified cardinal compass point is invalid")
        end
      end

    end
  end

end
