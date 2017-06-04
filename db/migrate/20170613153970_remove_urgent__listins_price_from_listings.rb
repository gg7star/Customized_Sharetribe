class RemoveUrgentListinsPriceFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :urgent_listins_price, :float
  end
end
