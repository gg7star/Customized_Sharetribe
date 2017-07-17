class AddUsertypeToPeople < ActiveRecord::Migration
  def change
    add_column :people, :usertype, :string
  end
end
