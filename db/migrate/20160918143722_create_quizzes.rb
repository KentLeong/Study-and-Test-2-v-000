class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.integer :user_id
      t.integer :concept_id
      t.text :question_ids, limit: 1333333337
      t.text :user_answers, limit: 1333333337
      t.timestamps
    end
  end
end
