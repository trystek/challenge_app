class Answer < ActiveRecord::Base
  acts_as_votable
  
  belongs_to :question
  belongs_to :user
  
  def accept
    if question.accepted_answer? || question.user == user
      false
    else
      self.accepted = true
      if self.save
        self.user.add_points(25)
        true
      end
    end
  end
  
  def accepted?
    accepted
  end
end
