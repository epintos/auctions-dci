class Bid < ActiveRecord::Base

  belongs_to :user
  belongs_to :auction

  validates :user, presence: true
  validates :auction, presence: true
  validates :amount, numericality: true

  validate :bigger_amount

  private

  def bigger_amount
    errors.add(:amount, :lower_bid) if AuctionBids.new(auction).last_bid.amount >= amount
  end

end
