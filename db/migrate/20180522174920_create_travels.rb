class CreateTravels < ActiveRecord::Migration[5.2]
  def change
    create_table :travels do |t|
      t.string :reservation_number
      t.string :mode
      t.date :start_date
      t.date :end_date
      t.references :trip, foreign_key: true
      t.string :compagny_name
      t.string :ticket_file
      t.string :address_in
      t.string :address_out
      t.float :latitude
      t.float :longitude
      t.time :start_date_time
      t.time :end_date_time

      t.timestamps
    end
  end
end
