# frozen_string_literal: true

class ChangeKindToBeIntegerInAccomodations < ActiveRecord::Migration[5.2]
  def change
    remove_column :accomodations, :kind, :string
    add_column :accomodations, :kind, :integer
  end
end
