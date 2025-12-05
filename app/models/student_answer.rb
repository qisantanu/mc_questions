class StudentAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  
  validates :selected_options, presence: true
  validates :user_id, uniqueness: { scope: :question_id }
  
  before_save :set_correctness
  
  private
  
  def set_correctness
    self.correct = question.check_answer(selected_options)
  end
end
