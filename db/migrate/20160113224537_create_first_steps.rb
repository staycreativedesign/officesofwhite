class CreateFirstSteps < ActiveRecord::Migration
  def change
    create_table :first_steps do |t|
      t.string :letter_of_presentation
      t.string :payment_proof
      t.integer :user_id
      t.timestamps
    end
  end
end
