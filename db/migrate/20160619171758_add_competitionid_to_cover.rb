class AddCompetitionidToCover < ActiveRecord::Migration
  def change
    add_column :covers, :competition_id, :integer
  end
end
