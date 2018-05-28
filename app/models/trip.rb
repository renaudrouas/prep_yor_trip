# frozen_string_literal: true

class Trip < ApplicationRecord
  has_many :diaries, dependent: :destroy
  has_many :stays, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :travels, dependent: :destroy
  has_many :accomodations, through: :stays
  belongs_to :user

  geocoded_by :destination
    after_validation :geocode, if: :will_save_change_to_destination?
end
