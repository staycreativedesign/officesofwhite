class CreateOfficeLocations < ActiveRecord::Migration
  def change
    create_table :office_locations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :email
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
