class AddLetterOfRepresentationIdAndPaymentVerificationIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :letter_of_representation_id, :integer, index: true
    add_column :users, :payment_verification_id, :integer, index: true
  end
end
