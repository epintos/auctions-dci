AuctionsDci::Application.routes.draw do

  devise_for :users

  root to: "auctions#index"

  resources :auctions do
    member do
      post :buy_now
    end
    resources :items
    resources :bids
  end

end
