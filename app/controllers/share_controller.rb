class ShareController < ApplicationController
  layout false

  def file_share
    @shares = Share.all
  end

  def upload
    file = params[:file]
    file_name = file.original_filename
    if File.exist? "public/uploads/#{file_name}"
      flash[:notice] = I18n.t('file_has_exist')
      redirect_to :action => :file_share
      return
    end
    file_path = Rails.root.join('public', 'uploads', file_name)
    File.open(file_path, 'wb') do |f|
      f.write(file.read)
    end
    share = Share.new
    share.people_id = session[:people_id]
    share.name = file.original_filename
    share.path = file_path
    share.upload_date= Time.now
    share.save
    redirect_to :action => :file_share
  end

  def download
    file_name = params[:file_name]
    if File.exist?  "public/uploads/#{file_name}"
      send_file  "public/uploads/#{file_name}", :disposition => 'attachment'
    else
      render :text => t('file_is_not_exist')
    end
  end

  def question_answer
    @question = Question.new
    get_last_ten_question
  end

  def add_question
    question = Question.create question_param
    if question.valid?
      question.save
      redirect_to :action => :get_questions
    else
      render :text => 'error'
    end

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
    @answers = Answer.where(question_id: @question.id).order('id desc')
    @answer = Answer.new
  end

  def delete_question
    question_id = params[:question_id]
    question = Question.find question_id
    question.destroy
    redirect_to :action => :question_answer
  end

  def more_question
    @questions = Question.all.order('id desc')
  end

  def add_answer
    answer = Answer.create answer_param
    answer.save
    @answers = Answer.where(question_id: params[:answer][:question_id]).order('id desc')

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
