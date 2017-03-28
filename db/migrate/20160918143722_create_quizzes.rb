class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.integer :user_id
      t.integer :concept_id
      t.integer :percent
      t.string :grade
      t.text :question_ids
      t.text :user_answers
      t.timestamps
    end
  end
end
