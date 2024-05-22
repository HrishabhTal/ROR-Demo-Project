class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true

  scope :by_user_id, ->(user_id) {
    joins(:user).where(users: { id: user_id })
  }
end
