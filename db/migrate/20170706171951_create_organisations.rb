class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :org_name
      # t.string :email
      t.text :phone_number
      t.string :org_type
      t.boolean :sent_offer, default: false
      t.boolean :subscription_complete, default: false

      t.timestamps 
    end
  end
end
