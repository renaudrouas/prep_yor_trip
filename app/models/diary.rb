class Diary < ApplicationRecord
  belongs_to :trip
  has_many :photos, dependent: :destroy
end
