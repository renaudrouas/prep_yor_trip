class AddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :travels, :latin, :float
    add_column :travels, :lngin, :float
    add_column :travels, :latout, :float
    add_column :travels, :lngout, :float
  end
end
