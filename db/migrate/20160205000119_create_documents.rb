class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :file
      t.boolean :is_approved, null: false, default: false

      t.timestamps null: false
    end
  end
end
