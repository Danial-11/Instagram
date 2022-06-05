# frozen_string_literal: true

# Likes controller
class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    redirect_to posts_path
  end

  def destroy
    @like = current_user.likes.find_by(id: params[:id]).destroy
    redirect_to posts_path
  end
end
