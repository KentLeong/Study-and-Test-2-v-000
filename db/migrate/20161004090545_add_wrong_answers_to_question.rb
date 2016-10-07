class AddWrongAnswersToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :wrong_answers, :text
  end
end
