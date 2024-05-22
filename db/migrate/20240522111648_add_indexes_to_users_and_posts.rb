class AddIndexesToUsersAndPosts < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :email, if_not_exists: true
    add_index :posts, :title, if_not_exists: true
    add_index :posts, :user_id, if_not_exists: true
  end
end
