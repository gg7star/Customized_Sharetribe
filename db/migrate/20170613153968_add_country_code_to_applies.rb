class AddCountryCodeToApplies < ActiveRecord::Migration
  def change
    add_column :applies, :country_code, :string
  end
end
