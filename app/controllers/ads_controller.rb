class AdsController < ApplicationController
    before_action :set_ad, only:[:show, :edit, :update, :destroy]
    helper AdsHelper

    def index
        kill_ad_session
        @ads = Ad.all
    end

    def new
        if current_ad == nil
            redirect_to root_url
        else
            @ad = Ad.new()
        end
    end

    def create
        @ad = Ad.new(ad_params.merge(employer: current_user))

        if @ad.save
            flash[:notice] = "Oglas za posao stvoren"
            redirect_to @ad
        else
            flash.now[:alert] = "Oglas za posao nije uspješno stvoren"
            render "new"
        end
    end

    def show
        remember(@ad)
        current_ad
    end

    def edit
        if current_user != @user
            redirect_to current_user
        end
    end

    def update
        if @ad.update(ad_params)
            flash[:notice] = "Oglas ažuriran"
            redirect_to @ad
        else
            flash.now[:alert] = "Oglas neusješno ažuriran"
            render "edit"
        end
    end

    def destroy
        @ad.destroy
        flash[:alert] = "Oglas za posao izbrisan uspješno"
        redirect_to ads_url
    end


    private

        def ad_params
            params.require(:ad).permit(:name, :body, :employer_name, :employer_email, :category, :time_period, :employer)
        end

        def set_ad
            @ad = Ad.find(params[:id])
            rescue ActiveRecord::RecordNotFound
                flash[:alert] = "Stranica koju ste zatražili ne postoji"
                redirect_to ads_url

        end
end
