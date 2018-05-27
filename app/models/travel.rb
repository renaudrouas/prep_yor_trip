# frozen_string_literal: true

class Travel < ApplicationRecord
  belongs_to :trip
  mount_uploader :ticket_file, PhotoUploader
  enum mode: %i[tbd avion train car bateau voiture]
  geocoded_by :address_in
  after_validation :geocode, if: :will_save_change_to_address_in?
end
