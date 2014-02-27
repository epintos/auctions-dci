class AuctionBids < SimpleDelegator

  def inialize(auction)
    super(auction)
  end

  def last_bid
    bids.order("amount ASC").last
  end

  def has_bids?
    bids.present?
  end

end
