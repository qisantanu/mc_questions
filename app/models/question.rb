class Question < ApplicationRecord
  has_many :student_answers, dependent: :destroy
  
  validates :content, presence: true
  validates :option_a, :option_b, presence: true
  validates :correct_options, presence: true
  
  def self.next_for_student(student)
    answered_ids = student.student_answers.pluck(:question_id)
    failed_ids = student.student_answers.where(correct: false).pluck(:question_id)
    
    # 30% chance to pick from failed questions
    if failed_ids.any? && rand < 0.3
      where(id: failed_ids).sample
    else
      where.not(id: answered_ids).sample || where(id: failed_ids).sample
    end
  end
  
  def check_answer(selected_options)
    selected_options.sort == correct_options.sort
  end
  
  def options
    [option_a, option_b, option_c, option_d].compact
  end
  
  def can_be_edited?
    !student_answers.where(correct: true).exists?
  end
end
