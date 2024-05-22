class CreatePostWorker
  include Sidekiq::Worker

  def perform
    user = Current.user

    if user
      user.posts.create(title: 'Daily Post', content: 'Feed')
    else
      Rails.logger.error("No user found in session.")
    end
  end
end
