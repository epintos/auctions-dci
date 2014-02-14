class AuctionBuyNowContext

  def initialize(current_user)
    @current_user = current_user
  end

  def handle(auction_id)
    auction = Auction.find(auction_id)
    auction.winner = @current_user
    auction.state = AuctionStateManager.new(auction).finished_status
    auction.save!
  end

end
