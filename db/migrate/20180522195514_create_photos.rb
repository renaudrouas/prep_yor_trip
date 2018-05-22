class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :photo
      t.references :diary, foreign_key: true

      t.timestamps
    end
  end
end
