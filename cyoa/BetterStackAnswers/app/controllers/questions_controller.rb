class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  def index
    @questions = Question.paginate(page: params[:page], per_page: 15)
    Question.stack_overflow_questions_and_answers if @questions.empty?
    @questions = Question.search_by_title(params[:search]).paginate(page: params[:page], per_page: 15) if params[:search]
  end

  def show
  end

  def questions_and_answers
    Question.stack_overflow_questions_and_answers
    redirect_to questions_url, notice: "Questions and Answers Added."
  end

  def new
    @question = Question.new
    @question.build_answer
  end

  def edit
    @question.build_answer if @question.answer.nil?
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:question_id, :accepted_answer_id, :body, :creation_date, :tags, :title, :up_vote_count, :answer_count, :is_answered, :link, :ruby_version, :rails_version, :version_updated, :user_id, answer_attributes: [:id, :question_id, :body])
  end
end
