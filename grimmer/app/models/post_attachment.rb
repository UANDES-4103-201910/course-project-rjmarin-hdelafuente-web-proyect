class PostAttachment < ApplicationRecord
  belongs_to :post
  mount_uploaders :avatars, AvatarUploader
  serialize :avatars, JSON
end
