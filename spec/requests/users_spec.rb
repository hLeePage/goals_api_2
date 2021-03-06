require 'rails_helper'
require 'request_helper'
require 'pry'

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

    it "returns an error when email is empty" do
      payload[:user][:email] = ""
      post users_path, payload
      expect(response).to have_http_status(422)
    end

    it "returns an error when password is empty" do
      payload[:user][:password] = ""
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

  describe "#follow/#unfollow" do
    it "enables a user to follow/unfollow another user" do
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

  describe "#update" do
    let(:payload) { { user: FactoryGirl.attributes_for(:user) } }
    it "enables a user to update his/her own profile" do
      user1
      user2
      payload[:user][:username] = "helmutthesmall"

      put user_path(user1), payload, { "authorization" => "Bearer #{token.token}" }
      get user_path(user1), {}, { "authorization" => "Bearer #{token.token}" }
      expect(json["username"]).to eq "helmutthesmall"
      expect(json["id"]).to eq user1.id
    end

    it "does not allow a user to update another user's profile" do
      user1
      user2

      payload[:user][:username] = "helmutthesmall"

      put user_path(user2), payload, { "authorization" => "Bearer #{token.token}" }
      expect(response).to have_http_status(422)
    end
  end



end
