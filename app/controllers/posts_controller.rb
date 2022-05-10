# frozen_string_literal: true

# posts controller
class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show]

  def index
    @posts = Post.all.limit(10).includes(:photos, :user, :likes)
    @userPosts = current_user.posts
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    images = params[:images]
    if @post.save
      images.each do |img|
        @post.photos.create(image: img)
      end
      flash[:notice] = 'Saved'
    else
      flash[:alert] = 'Something went wrong!'
    end
    redirect_to posts_path
  end

  def show
    @likes = @post.likes.includes(:user)
    @is_liked = @post.is_liked(current_user)
  end

  private

  def find_post
    @post = Post.find(params[:id])
    return if @post

    flash[:danger] = 'Post does not exist!'
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
