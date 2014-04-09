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
    id = params[:id]
    @question = Question.find id
    person = Person.find @question.people_id
    @name = person.name
    @answers = Answer.where(question_id:@question.id).order('id desc')
    @answer = Answer.new
  end

  def add_answer
    answer = Answer.create answer_param
    answer.save
    @answers =  Answer.where(question_id:params[:answer][:question_id]).order('id desc')

  end

  private
  def question_param
    params.require(:question).permit(:title, :content, :create_date, :people_id)
  end

  def get_last_ten_question
    @questions = Question.order('id desc').first 10
  end

  def answer_param
    params.require(:answer).permit(:question_id, :content, :answer_date, :people_id)
  end
end
