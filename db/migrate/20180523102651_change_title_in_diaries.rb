# frozen_string_literal: true

class ChangeTitleInDiaries < ActiveRecord::Migration[5.2]
  def change
    remove_column :diaries, :tittle, :string
    add_column :diaries, :title, :string
  end
end
