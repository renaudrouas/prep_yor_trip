class Accomodation < ApplicationRecord
  has_many :stays, dependent: :destroy
  enum kind: [ :tbd, :hotel, :camping, :auberge, :b_b, :habitant ]
end
