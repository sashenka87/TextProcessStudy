class Reading < ApplicationRecord
  belongs_to :participant
  validates_presence_of :text_id
  validates_presence_of :start_time
end
