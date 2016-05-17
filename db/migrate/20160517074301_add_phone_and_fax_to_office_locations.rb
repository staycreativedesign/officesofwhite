class AddPhoneAndFaxToOfficeLocations < ActiveRecord::Migration
  def change
    add_column :office_locations, :phone_number, :string
    add_column :office_locations, :fax_number, :string
  end
end
