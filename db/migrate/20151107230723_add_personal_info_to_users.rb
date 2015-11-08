class AddPersonalInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :suffix, :string
    add_column :users, :middle_name, :string
    add_column :users, :phone_number, :integer
    add_column :users, :client_driver_license, :string
    add_column :users, :client_social_security, :integer
    add_column :users, :client_dob, :date
    add_column :users, :client_registration_ip, :string
  end
end
