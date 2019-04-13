class Blacklist < ApplicationRecord
  belongs_to :user

  before_create :check_email
  private
  def check_email
    if email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      return true
    else
      errors.add(:email, "not a valid email")
      return false
    end
  end
end
