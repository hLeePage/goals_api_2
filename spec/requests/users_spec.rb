require 'rails_helper'
require 'request_helper'

RSpec.describe "Users" do

  let(:user1) { FactoryGirl.create :user }
  let(:user2) { FactoryGirl.create :user }
  let(:user3) { FactoryGirl.create :user }
  let(:token) { FactoryGirl.create(:access_token, resource_owner_id: user1.id) }

  describe "#create" do
    let(:payload) { { user: FactoryGirl.attributes_for(:user) } }

    it "successfully creates a user whose parameters are valid" do
      post users_path, payload
      expect(response).to have_http_status(:created)
    end

    it "returns an error when username is empty" do
      payload[:user][:username] = ""
      post users_path, payload
      expect(response).to have_http_status(422)
    end
  end

  describe "#index" do
    it "returns all users" do
      user1
      user2
      user3
      get users_path(format: :json)
      expect(response).to have_http_status(200)
      expect(json.count).to eq 3
    end
  end

  describe "#show" do
    it "displays a single user" do
      user1
      user2
      get user_path(user1), {}, { "authorization" => "Bearer #{token.token}" }
      expect(response).to have_http_status(200)
      expect(json["username"]).to eq user1.username
      expect(json["username"]).to_not eq user2.username
    end
  end

  describe "#follow" do
    it "enables a user to follow another user" do
      user1
      user2

      get following_user_path(user1), {}, { "authorization" => "Bearer #{token.token}" }
      expect(json.empty?).to be true  

      post follow_path(user_id: user2.id), {}, { "authorization" => "Bearer #{token.token}" }
      get following_user_path(user1), {}, { "authorization" => "Bearer #{token.token}" }

      expect(json[0]["email"]).to eq user2.email

      post unfollow_path(user_id: user2.id), {}, { "authorization" => "Bearer #{token.token}" }
      get following_user_path(user1), {}, { "authorization" => "Bearer #{token.token}" }
      expect(json.empty?).to be true
    end
  end

end
