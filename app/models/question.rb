class Question < ApplicationRecord
  has_many :student_answers, dependent: :destroy
  has_one_attached :image

  validates :content, presence: true
  validates :option_a, :option_b, presence: true
  validates :correct_options, presence: true

  def self.next_for_student(student)
    # Get questions that have been answered incorrectly (failed pool)
    failed_question_ids = student.student_answers.where(correct: false).pluck(:question_id).uniq

    # Get all questions that have been attempted
    attempted_question_ids = student.student_answers.pluck(:question_id).uniq

    # 30% chance to pick from failed questions if any exist
    if failed_question_ids.any? && rand < 0.3
      where(id: failed_question_ids).sample
    else
      # Pick from unattempted questions first, then from failed pool
      unattempted = where.not(id: attempted_question_ids)
      unattempted.any? ? unattempted.sample : where(id: failed_question_ids).sample
    end
  end

  def check_answer(selected_options)
    selected_options.sort == correct_options.sort
  end

  def options
    [ option_a, option_b, option_c, option_d ].compact
  end

  def can_be_edited?
    !student_answers.where(correct: true).exists?
  end
end
