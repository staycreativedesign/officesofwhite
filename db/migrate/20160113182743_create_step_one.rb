class CreateStepOne < ActiveRecord::Migration
  def change
    create_table :step_ones do |t|
      t.string :letter_of_presentation
      t.string :payment_proof
      t.integer :user_id
    end
  end
end
