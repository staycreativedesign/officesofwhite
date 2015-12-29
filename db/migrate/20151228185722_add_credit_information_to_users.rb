class AddCreditInformationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :credit_login, :string
    add_column :users, :credit_password, :string
    add_column :users, :credit_security_answer, :string
  end
end
