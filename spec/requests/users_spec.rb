require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET index" do

    it "response should be success" do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
