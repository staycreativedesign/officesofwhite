class AddProbonoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pro_bono, :boolean, null: false, default: false
  end
end
