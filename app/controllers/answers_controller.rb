class AnswersController < ApplicationController
  before_action :authenticate_user!, :set_question
  before_action :set_answer, only: [:like]

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.question = @question

    if @answer.save
      redirect_to question_path(@question), notice: "Answer was successfully created."
    else
      redirect_to question_path(@question), alert: "There was an error when adding answer."
    end
  end
  
  def like
    if @answer.user == current_user
      redirect_to question_path(@question), alert: 'You can not like your answers.'
    elsif not current_user.voted_for? @answer
      if @answer.liked_by current_user
        redirect_to question_path(@question), notice: "You like #{@answer.user}'s answer."
      else
        redirect_to question_path(@question), alert: 'There was an error when like answer.'
      end
    end
  end

  private

    def set_answer
      @answer = Answer.find(params[:answer_id])
    end

    def set_question
      @question = Question.find(params[:question_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:contents)
    end
end
