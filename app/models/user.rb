class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :recoverable, :rememberable and :trackable
  devise :database_authenticatable, :registerable, :validatable, :omniauthable, omniauth_providers: [:github]
  acts_as_voter
  mount_uploader :avatar, AvatarUploader

  has_many :questions
  has_many :answers
  
  validates :name, uniqueness: true, length: { in: 5..20 }
  
  before_create :set_points

  def to_s
    name
  end
  
  def add_points(value)
    self.points += value
    self.save
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.nickname
      user.remote_avatar_url = auth.info.image
    end
  end
  
  private

    def set_points
      self.points = 100
    end
end
