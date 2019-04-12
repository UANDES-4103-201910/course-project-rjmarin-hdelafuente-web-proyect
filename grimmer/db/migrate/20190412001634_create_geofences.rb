class CreateGeofences < ActiveRecord::Migration[5.2]
  def change
    create_table :geofences do |t|
      t.references :user, foreign_key: true
      t.string :region

      t.timestamps
    end
  end
end
