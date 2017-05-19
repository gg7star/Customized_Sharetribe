class AddPeopleInfoToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :given_name, :string
    add_column :conversations, :family_name, :string
    add_column :conversations, :email, :string
    add_column :conversations, :phonenumber, :string
    add_column :conversations, :phone_number, :string
    add_column :conversations, :house_number_or_name, :string
    add_column :conversations, :street, :string
    add_column :conversations, :area, :string
    add_column :conversations, :city, :string
    add_column :conversations, :postcode, :string
    add_column :conversations, :country, :string
    add_column :conversations, :age, :integer
    add_column :conversations, :gender, :string
  end
end
