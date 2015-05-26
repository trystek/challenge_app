class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  
  def accepted_answer?
    self.answers.any? { |answer| answer.accepted }
  end
end
