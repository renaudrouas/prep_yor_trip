# frozen_string_literal: true

class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.date :date
      t.text :description
      t.string :tittle
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
