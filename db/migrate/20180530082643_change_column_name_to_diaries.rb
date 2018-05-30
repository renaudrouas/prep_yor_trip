class ChangeColumnNameToDiaries < ActiveRecord::Migration[5.2]
  def change
    rename_column :diaries, :date, :start_date
  end
end
