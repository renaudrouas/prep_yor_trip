# frozen_string_literal: true

class ChangeModeInTravels < ActiveRecord::Migration[5.2]
  def change
    change_column :travels, :mode, :integer, default: 0
  end
end
