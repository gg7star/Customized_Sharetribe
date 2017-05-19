class AddTransactionIdToApplies < ActiveRecord::Migration
  def change
    add_column :applies, :transaction_id, :integer
  end
end
