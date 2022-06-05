namespace :delete do
  desc 'TODO'
  task delete_story: :environment do
    Story.where('created_at <= ?', 24.hours.ago).destroy_all
  end
end
