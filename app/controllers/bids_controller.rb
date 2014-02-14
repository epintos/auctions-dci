class BidsController < InheritedResources::Base

  before_filter :authenticate_user!

  FIELDS = [:amount, :auction_id]

  def create
    binding.pry
    @bid = BidCreationContext.new(current_user).handle(resource_params.first)
    create! do |success, failure|
      failure.html { redirect_to aution_path(resource_params.first) }
    end
  end

  def resource_params
    return [] if request.get?
    [params.require(:bid).permit(FIELDS)]
  end

end
