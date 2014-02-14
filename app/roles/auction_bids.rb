class AuctionBids < SimpleDelegator

  def inialize(auction)
    super(auction)
  end

  def last_bid
    bids.order("created_at ASC").last
  end

end
