require 'rails_helper'

RSpec.describe "Relationships" do

  describe "#create" do
    let(:relationship) { Relationship.create(follower_id: 1, followed_id: 2) }

    it "creates a new relationship" do
      #pry.bind
      expect(relationship[:follower_id]).to eq(1)
    end

    it "should be valid" do
      expect(relationship).to be_valid
    end

    it "should require a follower_id" do
      relationship[:follower_id] = nil
      expect(relationship).to_not be_valid
    end

    it "should require a followed_id" do
      relationship[:followed_id] = nil
      expect(relationship).to_not be_valid
    end

  end

end
