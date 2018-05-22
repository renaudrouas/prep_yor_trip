class Photo < ApplicationRecord
  belongs_to :diary
  mount_uploader :photo, PhotoUploader
end
