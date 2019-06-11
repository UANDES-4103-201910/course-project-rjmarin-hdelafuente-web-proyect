class AddColumnPostIdToGeofences < ActiveRecord::Migration[5.2]
  def change
    add_reference :geofences, :post, foreingn_key: true
  end
end
