class AddUsernameToUserProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :username, :string
  end
end
