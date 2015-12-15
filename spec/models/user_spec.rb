require 'rails_helper'

RSpec.describe "Users" do

  let(:user1) { FactoryGirl.create :user }
  let(:user2) { FactoryGirl.create :user }
  let(:token) { FactoryGirl.create(:access_token, resource_owner_id: user.id) }

  describe "#follow, #unfollow, #following?" do
    it "enables users to follow/unfollow other users" do
      expect(user1.following?(user2)).to be false
      user1.follow(user2)
      expect(user1.following?(user2)).to be true
      expect(user2.followers.include?(user1)).to be true
      user1.unfollow(user2)
      expect(user1.following?(user2)).to be false
      expect(user2.followers.include?(user1)).to be false
    end
  end

end
