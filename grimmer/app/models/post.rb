class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comment, :dependent => :destroy
  has_many :post_attachment, :dependent => :destroy
  has_many :post_vote, :dependent => :destroy
  has_many :post_report, :dependent => :destroy
  has_many :post_share, :dependent => :destroy
end
