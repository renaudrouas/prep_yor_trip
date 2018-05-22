class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :tittle
      t.text :description
      t.boolean :done
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
