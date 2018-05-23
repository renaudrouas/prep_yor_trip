class Travel < ApplicationRecord
  belongs_to :trip
  mount_uploader :ticket_file, PhotoUploader
  enum mode: [ :tbd, :avion, :train, :car, :bateau, :voiture ]
end
