# frozen_string_literal: true

# comments controller
class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = @post.comments.includes(:user)
  end

  def create
    ActiveRecord::Base.transaction do
      @comment = Comment.new(comment_params)
      if @comment.save
        @post = @comment.post
        redirect_to posts_path
      else
        flash[:alert] = 'Something went wrong ...'
      end
    end
  end

  def destroy
    ActiveRecord::Base.transaction do
      @comment = Comment.find(params[:id])
      @post = @comment.post
      if @comment.destroy
        redirect_to posts_path
      else
        flash[:alert] = 'Something went wrong ...'
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end
end
