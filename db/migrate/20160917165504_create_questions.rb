class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :answer
      t.string :definition
      t.timestamps
    end
  end
end