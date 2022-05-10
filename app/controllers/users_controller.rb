# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
  def index
    @users = User.includes(:posts)
    redirect_to new_user_session_path unless user_signed_in?
    @user_posts = current_user.posts
  end

  def search
    @query = params[:query]
    @usersearch = User.find_by(username: @query)
    if current_user.username == @usersearch.username
      render 'index'
    else
      render 'search'
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
