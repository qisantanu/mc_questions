class Admin::QuestionsController < Admin::BaseController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :check_editable, only: [:edit, :update, :destroy]
  
  def index
    @questions = Question.all.order(created_at: :desc)
  end
  
  def show
  end
  
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(question_params)
    
    if @question.save
      redirect_to admin_questions_path, notice: 'Question created successfully'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question), notice: 'Question updated successfully'
    else
      render :edit
    end
  end
  
  def destroy
    @question.destroy
    redirect_to admin_questions_path, notice: 'Question deleted successfully'
  end
  
  private
  
  def set_question
    @question = Question.find(params[:id])
  end
  
  def check_editable
    unless @question.can_be_edited?
      redirect_to admin_questions_path, alert: 'Cannot modify question that has been correctly answered'
    end
  end
  
  def question_params
    params.require(:question).permit(:content, :option_a, :option_b, :option_c, :option_d, :image, correct_options: [])
  end
end
