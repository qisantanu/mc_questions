class Admin::DashboardController < Admin::BaseController
  def index
    @students = User.students.includes(:student_answers)
    @total_questions = Question.count
    @total_students = @students.count
  end
end
