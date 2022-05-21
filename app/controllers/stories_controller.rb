# frozen_string_literal: true

# stories controller
class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_story, only: [:show]

  def index
    @stories = Story.all.limit(10).includes(:story_images, :user)
    @userStories = current_user.stories
    @story = Story.new
  end

  def create
    @story = current_user.stories.create(story_params)
    if @story.save
      if params[:images]
        params[:images].each do |img|
          @story.story_images.create(image: img)
        end
      end
      flash[:notice] = 'Saved'
      redirect_to stories_path
    else
      flash[:alert] = 'Something went wrong!'
      redirect_to stories_path
    end
  end

  def show; end

  private

  def find_story
    @story = Story.find_by id params[:id]
    return if @story

    flash[:danger] = 'Story does not exist'
    redirect_to root_path
  end

  def story_params
    params.require(:story).permit(:caption)
  end
end
