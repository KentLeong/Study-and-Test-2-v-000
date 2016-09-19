class CreateConcepts < ActiveRecord::Migration[5.0]
  def change
    create_table :concepts do |t|
      t.string :name
      t.string :description
      t.integer :subcategory_id
      t.string :slug
      t.index :slug
      t.timestamps
    end
  end
end
