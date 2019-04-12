class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.string :city
      t.string :country
      t.string :location
      t.boolean :status
      t.boolean :visibility

      t.timestamps
    end
  end
end
