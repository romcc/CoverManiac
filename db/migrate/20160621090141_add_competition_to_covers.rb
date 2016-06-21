class AddCompetitionToCovers < ActiveRecord::Migration
  def change
    add_column :covers, :competition, :boolean
  end
end
