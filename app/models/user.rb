class User < ApplicationRecord
  has_secure_password
  
  has_many :student_answers, dependent: :destroy
  has_many :questions, through: :student_answers
  
  validates :email, presence: true, uniqueness: true
  validates :role, inclusion: { in: %w[admin student] }
  
  scope :students, -> { where(role: 'student') }
  scope :admins, -> { where(role: 'admin') }
  
  def admin?
    role == 'admin'
  end
  
  def student?
    role == 'student'
  end
  
  def dashboard_stats
    return {} unless student?
    
    attempted = student_answers.count
    correct = student_answers.where(correct: true).count
    incorrect = attempted - correct
    success_percentage = attempted > 0 ? (correct.to_f / attempted * 100).round(2) : 0
    
    {
      attempted: attempted,
      correct: correct,
      incorrect: incorrect,
      success_percentage: success_percentage
    }
  end
  
  def daily_stats(days = 7)
    return [] unless student?
    
    (0...days).map do |i|
      date = i.days.ago.to_date
      day_answers = student_answers.where(created_at: date.beginning_of_day..date.end_of_day)
      attempted = day_answers.count
      correct = day_answers.where(correct: true).count
      success_rate = attempted > 0 ? (correct.to_f / attempted * 100).round(2) : 0
      
      {
        date: date.strftime('%m/%d'),
        attempted: attempted,
        success_rate: success_rate
      }
    end.reverse
  end
end
