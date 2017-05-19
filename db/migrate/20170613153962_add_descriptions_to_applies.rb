class AddDescriptionsToApplies < ActiveRecord::Migration
  def change
    add_column :applies, :medical_condition_description, :string
    add_column :applies, :hear_about_description, :string
    add_column :applies, :best_call_day_description, :string
    add_column :applies, :best_call_time_description, :string
    add_column :applies, :convenient_time_descriptin, :string
  end
end
