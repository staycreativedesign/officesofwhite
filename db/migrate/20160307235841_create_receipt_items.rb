class CreateReceiptItems < ActiveRecord::Migration
  def change
    create_table :receipt_items do |t|
      t.integer :receipt_id, index: true
      t.string :name
      t.string :value
      t.boolean :paid, null: false, default: false
    end
  end
end
