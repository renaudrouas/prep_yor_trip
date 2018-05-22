class Travel < ApplicationRecord
  belongs_to :trip
  mount_uploader :ticket_file, PhotoUploader
end
