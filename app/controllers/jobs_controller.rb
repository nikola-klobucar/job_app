class JobsController < ApplicationController
    before_action :set_job, only:[:show, :update, :destroy]

    def index
        @jobs = Job.all
    end

    def new
        @job = Job.new
    end

    def create
        @job = Job.new(job_params)

        if @job.save
            flash[:notice] = "Prijava za posao stvoren"
            redirect_to @job
        else
            flash.now[:alert] = "Prijava za posao nije uspješno stvoren"
            render "new"
        end
    end

    def show
    end

    def destroy
        @job.destroy
        flash[:alert] = "Prijava za posao izbrisana uspješno"
        redirect_to jobs_url
    end


    private

        def job_params
            params.require(:job).permit(:name, :body, :employer_name, :employer_email, :category, :time_period)
        end

        def set_job
            @job = Job.find(params[:id])
            rescue ActiveRecord::RecordNotFound
                flash[:alert] = "Stranica koju ste zatražili ne postoji"
                redirect_to jobs_url

        end
end
