class ChangeSsnToString < ActiveRecord::Migration
  def change
    change_column :users, :social_security, :string
  end
end
