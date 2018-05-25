# frozen_string_literal: true

class CreateAccomodations < ActiveRecord::Migration[5.2]
  def change
    create_table :accomodations do |t|
      t.string :address
      t.string :kind
      t.string :name
      t.string :e_mail
      t.string :phone_number
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
