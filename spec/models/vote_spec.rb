require 'rails_helper'

describe Vote do 

  describe "validations" do
    describe "value validations" do
      it "only allows -1 or 1 as values" do  
        up_v = Vote.new(value: 1)
        expect(up_v.valid?).to eq(true)

        down_v = Vote.new(value: -1)
        expect(down_v.valid?).to eq(true)

        invalid_v = Vote.new(value: 2)
        expect(invalid_v.valid?).to eq(false)
      end
    end
  end
end


