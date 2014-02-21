class AuctionBuyNowContext

  def initialize(current_user, auction)
    @current_user = current_user
    @auction = auction
  end

  def handle
    @auction.winner = @current_user
    @auction.status = AuctionStateManager.new(@auction).finished_status
    @auction.save!
  end

end
