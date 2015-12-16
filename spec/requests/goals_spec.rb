require 'rails_helper'
require 'request_helper'

RSpec.describe "Goals" do

  let(:user1) { FactoryGirl.create :user }
  let(:user2) { FactoryGirl.create :user }
  let(:user3) { FactoryGirl.create :user }
  let(:token) { FactoryGirl.create(:access_token, resource_owner_id: user1.id) }

end
