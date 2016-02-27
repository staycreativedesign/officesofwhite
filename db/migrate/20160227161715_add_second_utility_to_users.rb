class AddSecondUtilityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :second_utility_id, :integer
  end
end
