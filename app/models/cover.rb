class Cover < ActiveRecord::Base
  #  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }
  #validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
    belongs_to :user
    has_many :reviews
end
