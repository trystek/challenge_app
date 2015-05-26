class Answer < ActiveRecord::Base
  acts_as_votable
  
  belongs_to :question
  belongs_to :user
  
  after_create :send_mail
  
  def accept
    if question.accepted_answer? || question.user == user
      false
    else
      self.accepted = true
      if self.save
        self.user.add_points(25)
        UserMailer.accepted_answer(self).deliver
        true
      end
    end
  end
  
  def accepted?
    accepted
  end
  
  private
  
    def send_mail
      unless self.user == self.question.user
        UserMailer.new_answer(self).deliver
      end
    end
end
