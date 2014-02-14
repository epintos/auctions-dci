class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :status
      t.decimal :price
      t.integer :item_id
      t.integer :seller_id
      t.integer :winner_id
      t.datetime :end_date
      t.datetime :extended_end_date
      t.boolean :extendable

      t.timestamps
    end
  end
end
