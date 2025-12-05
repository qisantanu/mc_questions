class QuestionsController < ApplicationController
  before_action :require_student!
  
  def index
    redirect_to root_path
  end
  
  def show
    @question = Question.next_for_student(current_user)
    redirect_to dashboard_path, notice: 'No more questions available!' unless @question
  end
  
  def answer
    @question = Question.find(params[:id])
    selected = params[:selected_options] || []
    
    @student_answer = current_user.student_answers.build(
      question: @question,
      selected_options: selected
    )
    
    if @student_answer.save
      @correct = @student_answer.correct
      render :result
    else
      flash[:alert] = 'Please select at least one option'
      render :show
    end
  end
end
