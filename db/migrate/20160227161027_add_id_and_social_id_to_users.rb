class AddIdAndSocialIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :id_and_social_id, :integer
  end
end
