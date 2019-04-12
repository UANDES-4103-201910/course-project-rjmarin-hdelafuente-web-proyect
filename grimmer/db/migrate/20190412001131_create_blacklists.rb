class CreateBlacklists < ActiveRecord::Migration[5.2]
  def change
    create_table :blacklists do |t|
      t.references :user, foreign_key: true
      t.datetime :start_date
      t.datetime :ending_date

      t.timestamps
    end
  end
end
