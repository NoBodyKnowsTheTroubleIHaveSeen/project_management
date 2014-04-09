class ShareController < ApplicationController
  layout false

  def file_share
  end

  def question_answer
    @question = Question.new
    get_last_ten_question
  end

  def add_question
    question = Question.create question_param
    question.save
    redirect_to getQuestion_url
  end

  def get_questions
    get_last_ten_question
    render :get_questions
  end

  def get_question_detail

  end
  private
  def question_param
    params.require(:question).permit(:title,:content,:create_date,:people_id)
  end
  def get_last_ten_question
    @questions = Question.order('id desc').first 10
  end
end
