class Activity < ApplicationRecord
  belongs_to :participant
  validates_presence_of :text_id
  validates_presence_of :order
  validates_presence_of :action_string
  validates_presence_of :action_type
  validates_presence_of :time_since_page_load
  validates_presence_of :time_since_tooltip_open
end
