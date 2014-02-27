class AuctionsController < InheritedResources::Base

  before_filter :authenticate_user!

  FIELDS = [{ item_attributes: [:name, :description] }, :price, :end_date, :extendable, :id]

  def new
    @auction = Auction.new
    @auction.build_item
  end

  def create
    @auction = CreateAuctionContext.new(current_user).handle(resource_params.first)
    create!
  end

  def buy_now
    @auction = Auction.find(params[:id])
    status = AuctionBuyNowContext.new(current_user, @auction).handle
    unless status
      return redirect_to auction_path(@auction), flash: { notice: t('auctions.no_enough_account')}
    end
    redirect_to auction_path(@auction), flash: { notice: t('auctions.bought_successfully')}
  end

  def resource_params
    return [] if request.get?
    [params.require(:auction).permit(FIELDS)]
  end

end
