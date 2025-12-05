class RemoveUniqueConstraintStudentAnswers < ActiveRecord::Migration[8.0]
  def change
    remove_index :student_answers, [:user_id, :question_id]
    add_index :student_answers, [:user_id, :question_id]
  end
end
