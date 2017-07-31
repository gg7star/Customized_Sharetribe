class AddOrgNameToOrganisations < ActiveRecord::Migration
  def change
    add_column :organisations, :org_name, :string
    add_column :organisations, :org_phone_number, :string
    add_column :organisations, :org_type, :string
    add_column :organisations, :sent_offer, :boolean, default: false
    add_column :organisations, :subscription_complete, :boolean, default: false
    add_column :organisations, :community_id, :integer
    add_column :organisations, :test_group_number, :integer
    add_column :organisations, :locale, :string, limit: 4
  end
end
