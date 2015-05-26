class UserMailer < ActionMailer::Base
  default from: ENV['gmail_address']
  
  def new_answer(answer)
    @answer = answer
    mail(to: @answer.question.user.email, subject: "New answer by #{@answer.user}")
  end
end
