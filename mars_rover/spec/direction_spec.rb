describe Direction do
  describe "#initialize" do
    context "Given a direction instance initialized with valid moves" do
      it "should set the moves along which one is supposed to travel" do
        direction = Direction.new("LMLMMM")

        expect(direction.moves).to eq (['L','M','L','M','M','M'])
      end

      context "Given a direction instance with invalid moves" do
        it "should raise an error with an appropriate error message" do
          expect {Direction.new("ULA")}.to raise_error("Move specified as part of the path is an invalid one")
        end
      end

    end
  end

end