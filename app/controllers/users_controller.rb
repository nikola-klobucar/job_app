class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:notice] = "Upješno ste se registrirali"
            redirect_to @user
        else
            flash.now[:alert] = "Registracija je neuspješno obavljena"
            render :new
        end
    end

    def show
    end

    def edit
        if current_user != @user
            redirect_to current_user
        end
    end

    def update
        
    end


    private

        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
        end

        def set_user
            @user = User.find(params[:id])
        end
end
