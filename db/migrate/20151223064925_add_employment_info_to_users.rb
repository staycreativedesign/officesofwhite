class AddEmploymentInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :employer_name, :string
    add_column :users, :occupation, :string
    add_column :users, :employment_address, :string
    add_column :users, :employment_state, :string
    add_column :users, :employment_city, :string
    add_column :users, :employment_zipcode, :string
    add_column :users, :employment_phone, :string
    add_column :users, :employment_gross_income, :string
    add_column :users, :employment_years, :string
    add_column :users, :employment_months, :string
  end
end
