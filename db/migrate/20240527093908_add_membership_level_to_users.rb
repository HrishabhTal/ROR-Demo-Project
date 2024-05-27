class AddMembershipLevelToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :membership_level, :string, default: "silver"
  end
end
