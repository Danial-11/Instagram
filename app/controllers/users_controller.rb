class UsersController < ApplicationController
    def index
        @users = User.includes(:posts)
        if !user_signed_in?
            redirect_to new_user_session_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        
        if @user.update(user_params)
            redirect_to @user
        else
            render :edit, status: :unprocessable_entity
        end
    end
    

    private

        def user_params
            params.require(:user).permit(:username, :email)
        end
    end