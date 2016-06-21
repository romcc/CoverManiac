class AddUserIdToMessageBoard < ActiveRecord::Migration
  def change
    add_column :message_boards, :user_id, :integer
  end
end
