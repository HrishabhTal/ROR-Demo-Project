class User < ApplicationRecord
  has_many :posts
  has_secure_password
 validates:email, presence:true

 private

 def complex_password

   regex = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,}\z/

   unless password && regex.match?(password)
     errors.add(:password, "must contain at least one uppercase letter, one lowercase letter, and one digit.")
   end
  end
end
