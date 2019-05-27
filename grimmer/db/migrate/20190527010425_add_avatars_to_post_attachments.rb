class AddAvatarsToPostAttachments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_attachments, :avatars, :string
  end
end
