class AddFirstUtilityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_utility_id, :integer
  end
end
