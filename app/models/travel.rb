# before_save :geocode_endpoints

class Travel < ApplicationRecord
  belongs_to :trip
  mount_uploader :ticket_file, PhotoUploader
  enum mode: [:avion,:train,:car,:bateau,:voiture,]

  # geocoded_by :address_in
  # after_validation :geocode, if: :will_save_change_to_address_in?
  # geocoded_by :address_out
  # after_validation :geocode, if: :will_save_change_to_address_out?

# def update_coordinates
#   geocode
#   [latitude, longitude, latitude2, longitude2]
# end

# geocoded_by :address_in, :latitude => :latitude, :longitude => :longitude
# geocoded_by :address_out, :latitude => :latitude2, :longitude => :longitude2

#   private
#   #To enable Geocoder to works with multiple locations
#   def geocode_endpoints
#     if from_changed?
#       geocoded = Geocoder.search(loc1).first
#       if geocoded
#         self.latitude = geocoded.latitude
#         self.longitude = geocoded.longitude
#       end
#     end
#     # Repeat for destination
#         if to_changed?
#       geocoded = Geocoder.search(loc2).first
#       if geocoded
#         self.latitude2 = geocoded.latitude
#         self.longitude2 = geocoded.longitude
#       end
#     end
#   end



end
