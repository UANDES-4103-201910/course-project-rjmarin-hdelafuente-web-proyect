class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.references :user, foreign_key: true
      t.text :bio
      t.string :city
      t.string :country
      t.text :profile_picture
      t.string :location

      t.timestamps
    end
  end
end
