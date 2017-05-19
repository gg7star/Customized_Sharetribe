class AddApplierIdToApplies < ActiveRecord::Migration
  def change
    add_column :applies, :applier_id, :string
  end
end
