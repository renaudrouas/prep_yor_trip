class Task < ApplicationRecord
  belongs_to :trip

def completed?
  |completed_at.blank?
end


end
