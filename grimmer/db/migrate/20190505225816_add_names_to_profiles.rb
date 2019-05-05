class AddNamesToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :name, :string
    add_column :user_profiles, :last_name, :string
  end
end
