class AddAccountManagerRequiredToListings < ActiveRecord::Migration
  def change
    add_column :listings, :account_manager_required, :boolean
  end
end
