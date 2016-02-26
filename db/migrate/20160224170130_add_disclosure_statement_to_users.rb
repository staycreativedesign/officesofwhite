class AddDisclosureStatementToUsers < ActiveRecord::Migration
  def change
    add_column :users, :disclosure_statement_id, :integer, index: true
  end
end
