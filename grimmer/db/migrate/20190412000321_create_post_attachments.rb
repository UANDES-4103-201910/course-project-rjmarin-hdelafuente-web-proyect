class CreatePostAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_attachments do |t|
      t.references :post, foreign_key: true
      t.text :attachment

      t.timestamps
    end
  end
end
