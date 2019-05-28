class AddAvatarToPostAttachments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_attachments, :avatar, :string
  end
end
