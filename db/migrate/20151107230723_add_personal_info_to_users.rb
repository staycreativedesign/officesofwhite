class AddPersonalInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :suffix, :string
    add_column :users, :middle_name, :string
    add_column :users, :phone_number, :integer
    add_column :users, :other_number, :integer
    add_column :users, :driver_license, :string
    add_column :users, :social_security, :integer
    add_column :users, :dob, :date
    add_column :users, :registration_ip, :string
  end
end
