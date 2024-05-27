class User < ApplicationRecord
  has_many :posts
  has_secure_password
  validates:email, presence:true

  define_method("calculate_membership_level") do
    membership_levels = {
      "platinum" => 10..Float::INFINITY,
      "gold" => 5..9,
      "silver" => 0..4
    }

    membership_levels.each do |level, range|
      if self.posts.count >= range.begin && self.posts.count <= range.end
        self.update!(membership_level: level)
        break
      end
    end
  end
  private

  def complex_password

    regex = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,}\z/

    unless password && regex.match?(password)
     errors.add(:password, "must contain at least one uppercase letter, one lowercase letter, and one digit.")
    end
   end
  end
