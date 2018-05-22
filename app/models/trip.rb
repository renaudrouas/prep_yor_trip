class Trip < ApplicationRecord
  has_many :diaries, dependent: :destroy
  has_many :stays, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :travels, dependent: :destroy
  belongs_to :user
end
