class RenameCountryColumnToTrips < ActiveRecord::Migration[5.2]
  def change
    rename_column :trips, :country, :destination
  end
end
