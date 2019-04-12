class CreatePostVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :post_votes do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :vote

      t.timestamps
    end
  end
end
