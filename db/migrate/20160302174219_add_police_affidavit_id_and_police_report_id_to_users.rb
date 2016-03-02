class AddPoliceAffidavitIdAndPoliceReportIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :police_report_id, :integer, index: true
    add_column :users, :police_affidavit_id, :integer, index: true
  end
end
