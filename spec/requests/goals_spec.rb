require 'rails_helper'
require 'request_helper'
require 'pry'

RSpec.describe "Users" do

  let(:user1) { FactoryGirl.create :user }
  let(:user2) { FactoryGirl.create :user }
  let(:user3) { FactoryGirl.create :user }
  let(:token) { FactoryGirl.create(:access_token, resource_owner_id: user1.id) }

  describe "#create" do
    it "successfully creates a new goal from valid parameters" do
      user1
      payload = {"goal": {"body": "I will sell this house today."}}
      post goals_path, payload, { "authorization" => "Bearer #{token.token}" }
      expect()
    end

    it "returns an error when body is empty" do
      user1
      payload = {"goal": {"body":""}}
      expect()
    end
  end


end
