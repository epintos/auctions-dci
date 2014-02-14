class ChangeAuctionItemRelation < ActiveRecord::Migration
  def change
    remove_column :auctions, :item_id
    add_column :items, :auction_id, :integer
  end
end
