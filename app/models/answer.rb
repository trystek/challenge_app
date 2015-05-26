class Answer < ActiveRecord::Base
  acts_as_votable
  
  belongs_to :question
  belongs_to :user
end
