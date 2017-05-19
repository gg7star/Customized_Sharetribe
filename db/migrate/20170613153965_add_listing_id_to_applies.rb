class AddListingIdToApplies < ActiveRecord::Migration
  def change
    add_column :applies, :listing_id, :integer
  end
end
