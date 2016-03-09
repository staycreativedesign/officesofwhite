class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.integer :user_id, index: true
      t.string :name
      t.timestamps
    end
  end
end
