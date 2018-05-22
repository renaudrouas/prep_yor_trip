class Accomodation < ApplicationRecord
  has_many :stays, dependent: :destroy
end
