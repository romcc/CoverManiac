class AddAttachmentImageToCompetitions < ActiveRecord::Migration
  def self.up
    change_table :competitions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :competitions, :image
  end
end
