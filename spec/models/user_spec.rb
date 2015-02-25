require 'rails_helper'

describe User do
  
  include TestFactories

  describe "#favorited(post)" do
    
    it "returns `nil` if the user has not favorited the post" do
      expect(@user.favorites.where(post_id: post_id)).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      expect(@user.favorites.where(post_id: post_id).first).not_to be_nil
    end
  end  
end