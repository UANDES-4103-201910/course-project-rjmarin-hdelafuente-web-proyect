class AddColumnPostIdToGeofences < ActiveRecord::Migration[5.2]
  def change
    add_column :geofences, :post_id, :post
  end
end
