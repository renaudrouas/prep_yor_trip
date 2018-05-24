class Trip < ApplicationRecord
  has_many :diaries, dependent: :destroy
  has_many :stays, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :travels, dependent: :destroy
  belongs_to :user


# geocoded_by :full_address
#   after_validation :geocode, if: :full_address_changed?

#   def full_address
#     "#{address}, #{zip_code} #{city} #{ISO3166::Country[country].name}"
#   end

#   def full_address_changed?
#     address_changed? || zip_code_changed? || city_changed? || country_changed?
#   end


















end
