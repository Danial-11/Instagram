# frozen_string_literal: true

# stories controller
class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_story, only: %i[show destroy]

  def index
    @stories = Story.all.limit(1000).includes(:photos, :user)
    @user_stories = current_user.stories
    @story = Story.new
  end

  def create
    @story = current_user.stories.create(story_params)
    image = params[:images]
    if @story.save
      image.each do |img|
        @story.photos.create(image: img)
      end
      flash[:notice] = 'Story Created'
    else
      flash[:alert] = 'Something went wrong!'
    end
    redirect_to stories_path
  end

  def show; end

  def destroy
    ActiveRecord::Base.transaction do
      if @story.destroy
        flash[:notice] = 'Story deleted'
      else
        flash[:alert] = 'Something went wrong ...'
      end
    end
    redirect_to stories_path
  end

  private

  def find_story
    @story = Story.find(params[:id])
    authorize @story
    return if @story

    flash[:danger] = 'Story does not exist'
    redirect_to root_path
  end

  def story_params
    params.require(:story).permit(:caption)
  end
end
