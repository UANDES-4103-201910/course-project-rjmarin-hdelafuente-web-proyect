class AddLatitudeAndLogitudeColumnsToGeofences < ActiveRecord::Migration[5.2]
  def change
    add_column :geofences, :latitude, :decimal
    add_column :geofences, :longitude, :decimal
  end
end
