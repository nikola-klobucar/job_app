require 'rails_helper'

RSpec.describe AdsController, type: :controller do
  render_views
  describe "GET index" do
    before(:each) do
      @ad = build(:ad)
    end
    
    it "should have a link to the job page" do
      render :template => "widgets/widget.html.erb"

      expect(rendered).to render_template("index")
    end

    it "should render index" do
      get :index
      expect(response).to redirect_to(ad_path(@ad))
    end
  end
end
