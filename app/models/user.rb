class User < ActiveRecord::Base
  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  has_many :message_boards
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :covers
         has_many :reviews, dependent: :destroy
         
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid 
      user.email = auth.info.email
      user.save
    end
  end
  
  
  
  def self.new_with_session(params, session)
  if session["devise.user_attributes"]
    new(session["devise.user_attributes"], without_protection: true) do |user|
    user.attributes = params
    user.valid?
  end
  else
    super
  end
  end   
    def password_required?
      super && provider.blank?
    end
end   
