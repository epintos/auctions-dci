class BidsController < InheritedResources::Base

  before_filter :authenticate_user!

  FIELDS = [:amount, :auction_id]

  def new
    fetch_auction
    @bid = Bid.new
  end

  def create
    fetch_auction
    @bid = BidCreationContext.new(current_user, @auction).handle(resource_params.first)
    create!
  end

  private

  def resource_params
    return [] if request.get?
    [params.require(:bid).permit(FIELDS)]
  end

  def fetch_auction
    @auction = Auction.find(params[:auction_id])
  end

end
