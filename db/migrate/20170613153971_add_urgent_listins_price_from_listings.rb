class AddUrgentListinsPriceFromListings < ActiveRecord::Migration
  def change
    add_column :listings, :urgent_listings_price, :float
  end
end
