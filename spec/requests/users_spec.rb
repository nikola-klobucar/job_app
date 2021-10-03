require 'rails_helper'

RSpec.describe "/users", :type => :request do


  describe "GET index" do
    it "response should be success" do
      get users_url
      expect(response.status).to eq(200)
    end

    it "render the index template" do
      get users_url
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "renders a successful response" do
      user = build(:user)
      user.save
      get user_url(user)
      expect(response.status).to eq(200)
    end

    it "render the show template" do
      user = build(:user)
      user.save
      get user_url(user)
      expect(response).to render_template("show")
    end
  end

  describe "GET edit" do
    it "renders a successful response" do
      user = build(:user)
      user.save
      get user_url(user)
      expect(response.status).to eq(200)
    end

    it "render the show template" do
      user = build(:user)
      user.save
      get user_url(user)
      expect(response).to render_template("show")
    end
  end

  describe "POST create" do
    context "with valid parametes" do
      it "creates a new user" do
        expect do
          user = build(:user)
          user.save
        end.to change(User, :count).by(1)
      end

      it "redirects the created user" do
        attributes = attributes_for(:user)
        post users_url, params: {user: attributes}
        expect(response).to redirect_to(user_url(User.last))
      end
    end

    context "with invalid parameters" do

      let(:invalid_attributes) do
        {
          :id => "a"
        }
      end
      it "does not create a new user" do
        expect do
          post users_url, params: {user: invalid_attributes}
        end.to change(User, :count).by(0)
      end

      it "should render 'new' template" do
        post users_url, params: {user: invalid_attributes}
        expect(response).to render_template("new")
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "DELETE destory" do

    before do
      @user = build(:user)
      @user.save
      log_in @user
    end

    it "destorys the user" do
      log_out
      delete user_url(@user)
      expect(response).to redirect_to(root_url)
    end
  end
end
