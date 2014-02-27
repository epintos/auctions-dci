class Bid < ActiveRecord::Base

  belongs_to :user
  belongs_to :auction

  validates :user, presence: true
  validates :auction, presence: true
  validates :amount, numericality: true

  validate :bigger_amount
  validate :smaller_price
  validate :user_has_many

  private

  def bigger_amount
    last_bid = AuctionBids.new(auction).last_bid
    errors.add(:amount, :lower_bid) if last_bid.present? && amount.present? &&
                                        AuctionBids.new(auction).last_bid.amount >= amount &&
                                        amount <= auction.price
  end

  def smaller_price
    errors.add(:amount, :lower_bid_buy_it_now_price) if amount.present? && amount > auction.price
  end

  def user_has_many
    errors.add(:amount, :no_enough_account) if amount.present? && amount > user.account
  end

end
