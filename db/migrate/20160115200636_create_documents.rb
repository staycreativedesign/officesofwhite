class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.boolean :approved, default: false
      t.timestamps
    end
  end
end
