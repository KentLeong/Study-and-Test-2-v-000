class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :answer
      t.string :question_
      t.integer :user_id
      t.integer :concept_id
      t.integer :qtype
      t.integer :difficulty, default: 1
      t.timestamps
    end
  end
end
