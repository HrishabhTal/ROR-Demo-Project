class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true

  after_create :update_user_membership_level

  private

  def update_user_membership_level
    user.calculate_membership_level
  end

  scope :by_user_id, ->(user_id) {
    joins(:user).where(users: { id: user_id })
  }
end
