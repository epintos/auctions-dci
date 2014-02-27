class Bid < ActiveRecord::Base

  belongs_to :user
  belongs_to :auction

  validates :user, presence: true
  validates :auction, presence: true
  validates :amount, numericality: true

  validate :bigger_amount

  private

  def bigger_amount
    last_bid = AuctionBids.new(auction).last_bid
    errors.add(:amount, :lower_bid) if last_bid.present? && amount.present? &&
                                        AuctionBids.new(auction).last_bid.amount >= amount
  end

end
