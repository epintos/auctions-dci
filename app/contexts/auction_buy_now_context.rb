class AuctionBuyNowContext

  def initialize(current_user, auction)
    @current_user = current_user
    @auction = auction
  end

  def handle
    return false if @current_user.account < @auction.price
    @auction.winner = @current_user
    @auction.status = AuctionStateManager.new(@auction).finished_status
    pay_seller(@auction.seller, @auction.price)
    discount_winner(@auction.winner, @auction.price)
    @auction.save
  end

  private

    def pay_seller(seller, amount)
      seller.update_attributes!(account: seller.account + amount)

    end

    def discount_winner(winner, amount)
      winner.update_attributes!(account: winner.account - amount)
    end

end
