class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.paginate(:page => params[:page], :per_page => 15)
    if @questions.empty?
      request = StackOverflow.new
      request.stack_questions
      request.create_questions_from_json
      request.stack_answers
      request.create_answers_from_json  
    end
    if params[:search]
      @questions = Question.search_by_title(params[:search]).paginate(:page => params[:page], :per_page => 15)
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    @question.build_answer
  end

  # GET /questions/1/edit
  def edit
    @question.build_answer if @question.answer.nil?
  end

  # POST /questions
  # POST /questions.json
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

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
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

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question_id, :accepted_answer_id, :body, :creation_date, :tags, :title, :up_vote_count, :answer_count, :is_answered, :link, :ruby_version, :rails_version, :version_updated, :user_id, answer_attributes: [:id, :question_id, :body])
    end
end
