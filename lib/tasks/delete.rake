namespace :delete do
  desc 'TODO'
  task delete_story: :environment do
    Story.where('created_at <= ?', 1.minute.ago).destroy_all
  end
end
