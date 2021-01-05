class Participant < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :passcode
  validates_presence_of :class_code
  validates_presence_of :section

  has_many :readings, class_name: "Reading", foreign_key: "participant_id", dependent: :destroy

  def self.class_codes
    [
      "EDPSY 14",
      "EDPSY 10",
      "EDPSY 11",
      "EDPSY 101",
      "N/A"
    ]
  end

  def self.section_names
    [
      "001",
      "002",
      "N/A"
    ]
  end

  def random_reading_order(num_readings, randomized)
    if randomized
      array = (1..num_readings).to_a
      array.shuffle(random: Random.new(self.id))
    else
      (1..num_readings).to_a
    end
  end
end
