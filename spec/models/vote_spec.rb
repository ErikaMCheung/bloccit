require 'rails_helper'

describe Vote do 

  include TestFactories

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

    describe 'after_save' do
      it "calls 'Post#update_rank' after save" do
        post = associated_post
        vote = Vote.new(value: 1, post: post)
        expect(post).to receive(:update_rank)
          vote.save
      end    
    end
end


