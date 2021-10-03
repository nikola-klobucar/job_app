require 'rails_helper'

RSpec.describe '/ads', type: :request do
  describe "GET index" do
    it "response should be success" do
      get ads_url
      expect(response.status).to eq(200)
    end

    it "render the index template" do
      get ads_url
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "renders a successful response" do
      ad = build(:ad)
      ad.save
      get ad_url(ad)
      expect(response.status).to eq(200)
    end

    it "render the show template" do
      ad = build(:ad)
      ad.save
      get ad_url(ad)
      expect(response).to render_template("show")
    end
  end

  describe "GET edit" do
    it "renders a successful response" do
      ad = build(:ad)
      ad.save
      get ad_url(ad)
      expect(response.status).to eq(200)
    end

    it "render the show template" do
      ad = build(:ad)
      ad.save
      get ad_url(ad)
      expect(response).to render_template("show")
    end
  end

  describe "POST create" do

    context "with valid parametes" do

      it "creates a new ad" do
        expect do
          ad = build(:ad)
          ad.save
        end.to change(Ad, :count).by(1)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) do
        {
          :id => "1"
        }
      end
      it "does not create a new ad" do
        expect do
          post ads_url, params: {ad: invalid_attributes}
        end.to change(Ad, :count).by(0)
      end

      it "should render 'new' template" do
        post ads_url, params: {ad: invalid_attributes}
        expect(response).to render_template("new")
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "DELETE destory" do

    before do
      @ad = build(:ad)
      @ad.save
    end

    it "destorys the ad" do
      delete ad_url(@ad)
      expect(response).to redirect_to(root_url)
    end
  end
end
