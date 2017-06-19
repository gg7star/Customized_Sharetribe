class AddDeltaToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :delta, :boolean , default: true
  end
end
