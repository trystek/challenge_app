class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :recoverable, :rememberable and :trackable
  devise :database_authenticatable, :registerable, :validatable
  acts_as_voter

  has_many :questions
  has_many :answers
  
  validates :name, uniqueness: true, length: { in: 5..20 }
  
  before_create :set_points

  def to_s
    email
  end
  
  def add_points(value)
    self.points += value
    self.save
  end
  
  private

    def set_points
      self.points = 100
    end
end
