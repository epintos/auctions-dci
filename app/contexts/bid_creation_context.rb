class BidCreationContext

  def initialize(current_user)
    @current_user = current_user
  end

  def handle(params)
    bid = Bid.create(params)
    bid.user = @current_user
    bid
  end

end
