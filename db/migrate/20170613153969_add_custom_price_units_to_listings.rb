class AddCustomPriceUnitsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :basic_listings_price, :float
    add_column :listings, :featured_listings_price, :float
    add_column :listings, :urgent_listins_price, :float
  end
end
