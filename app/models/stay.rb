# frozen_string_literal: true

class Stay < ApplicationRecord
  belongs_to :trip
  belongs_to :accomodation
  validates :start_date, presence: true
end
