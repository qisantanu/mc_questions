class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.text :content, null: false
      t.string :option_a, null: false
      t.string :option_b, null: false
      t.string :option_c
      t.string :option_d
      t.json :correct_options, null: false
      t.timestamps
    end
  end
end
