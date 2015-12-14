require 'rails_helper'
require 'request_helper'

RSpec.describe "Users" do

  let(:user1) { FactoryGirl.create :user }
  let(:user2) { FactoryGirl.create :user }
  let(:user3) { FactoryGirl.create :user }

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
    get user_path(user1)
    expect(response).to have_http_status(200)
    expect(json["username"]).to eq user1.username
    expect(json["username"]).to_not eq user2.username
  end
end

end
