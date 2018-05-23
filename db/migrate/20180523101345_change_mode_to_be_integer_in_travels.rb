class ChangeModeToBeIntegerInTravels < ActiveRecord::Migration[5.2]
  def change
    remove_column :travels, :mode, :string
    add_column :travels, :mode, :integer
  end
end
