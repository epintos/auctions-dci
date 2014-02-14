class CreateAuctionContext

  def initialize(current_user)
    @current_user = current_user
  end

  def handle(params)
    @auction = Auction.new(params)
    @auction.seller = @current_user
    @auction
  end

end
