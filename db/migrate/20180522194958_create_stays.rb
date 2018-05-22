class CreateStays < ActiveRecord::Migration[5.2]
  def change
    create_table :stays do |t|
      t.date :start_date
      t.date :end_date
      t.references :trip, foreign_key: true
      t.references :accomodation, foreign_key: true
      t.string :reservation_number

      t.timestamps
    end
  end
end
