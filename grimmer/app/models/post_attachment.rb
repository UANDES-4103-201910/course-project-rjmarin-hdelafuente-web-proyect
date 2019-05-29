class PostAttachment < ApplicationRecord
  belongs_to :post
  has_many_attached :avatars

end
