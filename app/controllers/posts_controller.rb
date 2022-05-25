# frozen_string_literal: true

# post controller
class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: %i[show destroy]

  def index
    @posts = Post.all.limit(10).includes(:photos, :user, :likes).order('created_at desc')
    @userPosts = current_user.posts
    @post = Post.new
  end

  def create
    ActiveRecord::Base.transaction do
      @post = current_user.posts.build(post_params)
      if @post.save
        if params[:images]
          params[:images].each do |img|
            @post.photos.create(image: img)
          end
        end
        redirect_to posts_path
        flash[:notice] = 'Post created'
      else
        flash[:alert] = 'Something went wrong ...'
        redirect_to posts_path
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    ActiveRecord::Base.transaction do
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to @post
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def show
    @posts = Post.all
    @photos = @post.photos
    @comment = Comment.new
  end

  def destroy
    ActiveRecord::Base.transaction do
      if @post.user == current_user
        if @post.destroy
          flash[:notice] = 'Post deleted'
        else
          flash[:alert] = 'Something went wrong ...'
        end
      else
        flash[:notice] = 'you do not have permission to do that...'
      end
    end
    redirect_to posts_path
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
