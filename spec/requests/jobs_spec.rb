require 'rails_helper'

RSpec.describe "Jobs", type: :request do

  describe "GET show" do
    it "renders a successful response" do
      job = build(:job)
      job.save
      get job_url(job)
      expect(response.status).to eq(200)
    end

    it "render the show template" do
      job = build(:job)
      job.save
      get job_url(job)
      expect(response).to render_template("show")
    end
  end

  describe "POST create" do
    context "with valid parametes" do

      it "creates a new job" do
        expect do
          job = build(:job)
          job.save
        end.to change(Job, :count).by(1)
      end
    end

    context "with invalid parameters" do

      let(:invalid_attributes) do
        {
          :id => "a"
        }
      end

      it "does not create a new job" do
        expect do
          post jobs_url, params: {job: invalid_attributes}
        end.to change(Job, :count).by(0)
      end

      it "should render 'new' template" do
        post jobs_url, params: {job: invalid_attributes}
        expect(response).to render_template("new")
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "DELETE destory" do

    before do
      @job = build(:job)
      @job.save
    end

    it "destorys the job" do
      delete job_url(@job)
      expect(response).to redirect_to(root_url)
    end
  end
end
