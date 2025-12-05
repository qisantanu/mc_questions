class StudentAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  
  validates :selected_options, presence: true
  
  before_save :set_correctness
  
  private
  
  def set_correctness
    self.correct = question.check_answer(selected_options)
  end
end
