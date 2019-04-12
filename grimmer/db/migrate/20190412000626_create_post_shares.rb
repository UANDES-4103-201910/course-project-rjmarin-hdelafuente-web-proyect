class CreatePostShares < ActiveRecord::Migration[5.2]
  def change
    create_table :post_shares do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
