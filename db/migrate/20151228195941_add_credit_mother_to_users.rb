class AddCreditMotherToUsers < ActiveRecord::Migration
  def change
    add_column :users, :credit_mother_dob, :date
  end
end
