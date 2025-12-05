class CreateStudentAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :student_answers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.json :selected_options, null: false
      t.boolean :correct, null: false
      t.timestamps
    end

    add_index :student_answers, [ :user_id, :question_id ], unique: true
  end
end
