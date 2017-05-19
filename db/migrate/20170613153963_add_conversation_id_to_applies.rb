class AddConversationIdToApplies < ActiveRecord::Migration
  def change
    add_column :applies, :conversation_id, :integer
  end
end
