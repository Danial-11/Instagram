# frozen_string_literal: true

# Likes controller
class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.build(like_params)
    @post = @like.post
    if @like.save
      respont_to :js
    else
      flash[:alert] = 'something went wrong...'
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @post = @like.post
    if like.destroy
      respont_to :js
    else
      flash[:alert] = 'Something went wrong...'
    end
  end

  private

  def like_params
    params.permit[:post_id]
  end
end
