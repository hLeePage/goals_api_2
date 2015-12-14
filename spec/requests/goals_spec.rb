require 'rails_helper'
require 'request_helper'

RSpec.describe "Goals" do

  let(:user1) { FactoryGirl.create :user }
  let(:user2) { FactoryGirl.create :user }
  let(:user3) { FactoryGirl.create :user }

  describe "#create" do
    let(:payload) { { goal: FactoryGirl.attributes_for(:goal) } }

    it "successfully creates a user whose parameters are valid" do
      post goals_path, payload
      expect(response).to have_http_status(:created)
    end

    it "returns an error when username is empty" do
      payload[:goal][:body] = ""
      post goals_path, payload
      expect(response).to have_http_status(422)
    end

    it "correctly associates goal.user_id with user.id" do
      user1
      user2
      payload[:goal][:user_id] = user2.id
      #pry.bind
      post goals_path, payload
      #pry.bind
      expect(json["user_id"]).to eq(user2.id)
    end

  end

end
