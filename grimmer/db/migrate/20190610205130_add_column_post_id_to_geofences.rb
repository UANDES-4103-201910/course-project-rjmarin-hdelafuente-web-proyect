class AddColumnPostIdToGeofences < ActiveRecord::Migration[5.2]
  def change
    add_reference :geofences, :post, foreign_key: true
  end
end
