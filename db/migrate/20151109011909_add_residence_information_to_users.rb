class AddResidenceInformationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :home_address, :string
    add_column :users, :city, :string
    add_column :users, :zipcode, :integer
    add_column :users, :time_at_address_months, :string
    add_column :users, :time_at_address_years, :string
    add_column :users, :residence_type, :string
    add_column :users, :household_payment, :string
  end
end
