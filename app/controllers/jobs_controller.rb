class JobsController < ApplicationController
    before_action :set_job, only:[:show, :update, :destroy]

    def new
        if session[:ad_id] == nil
            redirect_to root_url
        else
            @job = Job.new()
        end
    end

    def create
        @job = Job.new(job_params.merge(applicant: current_user, ad: current_ad))
        if @job.save
            ApplicantMailer.with(
                job: @job
            ).job_created.deliver_later
            
            EmployerMailer.with(
                job: @job
            ).job_created.deliver_later

            flash[:notice] = "Prijava za posao uspješno stvorena"
            redirect_to @job.applicant
        else
            flash.now[:alert] = "Prijava za posao nije uspješno stvorena"
            render "new"
        end
    end

    def show
    end

    def destroy
        @job.destroy
        flash[:alert] = "Prijava za posao izbrisana uspješno"
        redirect_to root_url
    end


    private

        def job_params
            params.require(:job).permit(:first_name, :last_name, :email, :phone, :address, :qualification, :applicant)
        end

        def set_job
            @job = Job.find(params[:id])
            rescue ActiveRecord::RecordNotFound
                flash[:alert] = "Stranica koju ste zatražili ne postoji"
                redirect_to @job.employer

        end
end
