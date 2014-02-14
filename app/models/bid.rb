class Bid < ActiveRecord::Base

  belongs_to :user
  belongs_to :auction

  validates :user, presence: true
  validates :auction, presence: true
  validates :amount, numericality: true

end
