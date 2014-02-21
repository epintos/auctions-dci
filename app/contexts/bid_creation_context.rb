class BidCreationContext

  def initialize(current_user, auction)
    @current_user = current_user
    @auction = auction
  end

  def handle(params)
    bid = Bid.new(params)
    bid.auction = @auction
    bid.user = @current_user
    bid
  end

end
