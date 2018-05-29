# frozen_string_literal: true

class Accomodation < ApplicationRecord
  has_many :stays, dependent: :destroy
  enum kind: [:hotel, :camping, :auberge, :b_b, :habitant,]
  accepts_nested_attributes_for :stays, reject_if: :all_blank

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

