# frozen_string_literal: true

# delete stories job
class DeleteStoryJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Story.where('created_at <= ?', 24.hours.ago).destroy_all
  end
end
