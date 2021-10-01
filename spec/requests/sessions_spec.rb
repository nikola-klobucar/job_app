require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  describe "GET new" do
    let(:user) {create(:user)}

    it "should response success" do
      get :new
      expect(response.status).to eq(200)
    end

    it "should render login view" do
      get :new
      expect(response.body).to  match("")
    end
  end
end
