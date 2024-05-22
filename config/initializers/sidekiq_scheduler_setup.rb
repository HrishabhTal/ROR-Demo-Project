require 'sidekiq'
require 'sidekiq-scheduler'

Sidekiq.set_schedule('daily_post_creation_for_all_users', {
  cron: '* * * * *',
  class: 'CreatePostWorker',
  args: []
})
