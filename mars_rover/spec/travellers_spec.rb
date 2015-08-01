describe Travellers do

  describe "#initialize" do
    context "Given a travellers instance" do
      it "should have an array collection of individual travellers" do
        location = Location.new(1,2,'N')
        traveller = Traveller.new(location, "LMLMM")

        location2 = Location.new(1,2,'S')
        traveller2 = Traveller.new(location2, "LMLML")

        travellers = Travellers.new([traveller, traveller2])
        expect(travellers.traveller).to be_an(Array)

        travellers2 = Travellers.new()
        expect(travellers2.traveller).to be_an(Array)

      end
    end
  end

end