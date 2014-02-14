AuctionsDci::Application.routes.draw do

  devise_for :users

  root to: "auctions#index"

  resources :auctions do
    resources :items
    resources :bids
  end

end
