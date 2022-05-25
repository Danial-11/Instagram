# frozen_string_literal: true

# schedule.rb
set :environment, 'development'
every 1.minute do
  rake 'delete:delete_story'
end
