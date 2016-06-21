class CreateMessageBoards < ActiveRecord::Migration
  def change
    create_table :message_boards do |t|
      t.string :title
      t.text :message

      t.timestamps null: false
    end
  end
end
