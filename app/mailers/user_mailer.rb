class UserMailer < ActionMailer::Base
  default from: ENV['gmail_address']
  
  def accepted_answer(answer)
    @answer = answer
    mail(to: @answer.user.email, subject: 'Your answer was accepted')
  end
  
  def new_answer(answer)
    @answer = answer
    mail(to: @answer.question.user.email, subject: "New answer by #{@answer.user}")
  end
end
