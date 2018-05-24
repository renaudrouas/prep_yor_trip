class Accomodation < ApplicationRecord
  has_many :stays, dependent: :destroy
  enum kind: [ :tbd, :hotel, :camping, :auberge, :b_b, :habitant ]
   accepts_nested_attributes_for :stays
end
