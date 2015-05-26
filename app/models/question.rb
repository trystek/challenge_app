class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  
  validates :title, presence: true
  
  after_create :create_points
  
  def accepted_answer?
    self.answers.any? { |answer| answer.accepted }
  end
  
  private
  
    def create_points
      self.user.add_points(-10)
    end
end
