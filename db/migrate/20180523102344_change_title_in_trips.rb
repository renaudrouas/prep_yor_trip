class ChangeTitleInTrips < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :tittle, :string
    add_column :trips, :title, :string
  end
end
