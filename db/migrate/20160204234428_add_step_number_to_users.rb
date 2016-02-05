class AddStepNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :step_number, :integer, default: 0
  end
end
