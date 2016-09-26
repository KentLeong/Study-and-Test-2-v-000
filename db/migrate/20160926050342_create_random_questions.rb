class CreateRandomQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :random_questions do |t|
      t.string :name
      t.integer :question_id
      t.timestamps
    end
  end
end
