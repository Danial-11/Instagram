class UsersController < ApplicationController

    def homepage
        if !user_signed_in?
            redirect_to new_user_session_path
        end
    end
    
    end