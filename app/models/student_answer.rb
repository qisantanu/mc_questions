class StudentAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  before_save :set_correctness

  private

  def set_correctness
    self.correct = selected_options.present? ? question.check_answer(selected_options) : false
  end
end
