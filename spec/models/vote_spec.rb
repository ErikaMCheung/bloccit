describe Vote do 
  describe "validations" do

    describe "#up_vote value validation" do
      it "only allows 1 as value" do
       expect(@vote.up_votes). to eq(1)
     end
   end

    describe "#{}down_vote value validation" do 
      it "only allows -1 as value" do 
        expect(@vote.down_votes). to eq(-1)
      end
    end
  end
end