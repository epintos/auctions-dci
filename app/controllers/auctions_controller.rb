class AuctionsController < InheritedResources::Base

  before_filter :authenticate_user!

  FIELDS = [{ item_attributes: [:name, :description] }, :price, :end_date, :extendable]

  def new
    @auction = Auction.new
    @auction.build_item
  end

  def create
    @auction = CreateAuctionContext.new(current_user).handle(resource_params.first)
    create! do |success, failure|
      success.html { redirect_to new_auction_bid_path(@auction) }
    end
  end

  def resource_params
    return [] if request.get?
    [params.require(:auction).permit(FIELDS)]
  end

end
