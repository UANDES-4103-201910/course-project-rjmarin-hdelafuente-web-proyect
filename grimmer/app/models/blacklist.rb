class Blacklist < ApplicationRecord
  belongs_to :user

  before_create :check_dates
  private
  def check_dates
    if start_date > ending_date
      errors.add(:start_date, "start date must be before ending date")
      return false
    else
      return true
    end
  end
end
