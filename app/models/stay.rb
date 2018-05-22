class Stay < ApplicationRecord
  belongs_to :trip
  belongs_to :accomodation
end
