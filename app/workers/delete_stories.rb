# frozen_string_literal: true

# Sidekiq work
class DeleteStories
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { 1.minute }

  def perform
    Story.recent.destroy_all
  end
end
