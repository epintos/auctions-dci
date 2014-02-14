class AuctionStateManager < SimpleDelegator

  def initialize(auction)
    super(auction)
  end

  def finished_status
    self.status = :closed
  end

end
