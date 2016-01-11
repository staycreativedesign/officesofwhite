class ChangeOtherPhoneToString < ActiveRecord::Migration
  def change
    change_column :users, :other_number, :string
  end
end
