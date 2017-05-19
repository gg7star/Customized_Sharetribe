class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.string :given_name
      t.string :family_name
      t.string :email
      t.string :phone_number
      t.string :house_number_or_name
      t.string :street
      t.string :area
      t.string :city
      t.string :postcode
      t.string :country
      t.integer :age
      t.string :gender

      t.timestamps null: false
    end
  end
end
