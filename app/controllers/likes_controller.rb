# frozen_string_literal: true

# Like controller
class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    ActiveRecord::Base.transaction do
      @like = current_user.likes.build(like_params)
      @post = @like.post
      if @like.save
        respont_to :js
      else
        flash[:alert] = 'something went wrong...'
      end
    end
  end

  def destroy
    ActiveRecord::Base.transaction do
      @like = Like.find(params[:id])
      @post = @like.post
      if like.destroy
        respont_to :js
      else
        flash[:alert] = 'Something went wrong...'
      end
    end
  end

  private

  def like_params
    params.permit[:post_id]
  end
end
