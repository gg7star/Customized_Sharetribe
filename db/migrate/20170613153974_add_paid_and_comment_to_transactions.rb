class AddPaidAndCommentToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :paid, :boolean
    add_column :transactions, :comment, :string
  end
end
