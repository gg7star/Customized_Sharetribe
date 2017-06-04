class AddPlanToListings < ActiveRecord::Migration
  def change
    add_column :listings, :plan, :string
  end
end
