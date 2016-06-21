class AddUserIdToCovers < ActiveRecord::Migration
  def change
    add_column :covers, :user_id, :integer
  end
end
