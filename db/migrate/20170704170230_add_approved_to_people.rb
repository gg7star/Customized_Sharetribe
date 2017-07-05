class AddApprovedToPeople < ActiveRecord::Migration
  def change
    add_column :people, :approved, :boolean, :default => false, :null => false
  end
end
