# frozen_string_literal: true

class Photo < ApplicationRecord
  belongs_to :diary
  mount_uploader :photo, PhotoUploader
end
