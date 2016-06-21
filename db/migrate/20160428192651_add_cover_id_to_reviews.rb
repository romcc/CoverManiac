class AddCoverIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :cover_id, :integer
  end
end
