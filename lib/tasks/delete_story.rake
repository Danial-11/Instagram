namespace :delete do
    desc 'Delete records older than 24 hours'
    task :old_stories => :environment do
      
      Story.where('created_at > ?', 2.minutes.ago).destroy_all
      end
    end
  end