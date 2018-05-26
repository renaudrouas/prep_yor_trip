# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :trip

  # def completed?
  #   :done == true
  # end

end
