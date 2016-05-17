class AddOfficeLocationIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :office_location_id, :integer
  end
end
