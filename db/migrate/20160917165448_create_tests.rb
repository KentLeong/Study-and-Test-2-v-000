class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.string :name
      t.integer :concept_id
      t.timestamps
    end
  end
end
