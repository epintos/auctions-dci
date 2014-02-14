AuctionsDci::Application.routes.draw do
  devise_for :users

  root to: "auctions#index"
end
