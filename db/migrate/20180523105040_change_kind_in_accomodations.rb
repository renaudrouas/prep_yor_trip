class ChangeKindInAccomodations < ActiveRecord::Migration[5.2]
  def change
    change_column :accomodations, :kind, :integer, default: 0
  end
end
