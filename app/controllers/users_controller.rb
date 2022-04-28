class UsersController < ApplicationController
    def index
        @users = User.includes(:posts)
        if !user_signed_in?
            redirect_to new_user_session_path
        end
    end
    
    end