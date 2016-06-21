class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do |t|
      t.string :title
      t.text :description
      t.string :author
      t.string :ytlink

      t.timestamps
    end
  end
end
