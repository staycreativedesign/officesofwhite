class AddServiceAgreementToUsers < ActiveRecord::Migration
  def change
    add_column :users, :service_agreement_id, :integer, index: true
  end
end
