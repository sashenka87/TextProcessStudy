class AddStartTimeToReading < ActiveRecord::Migration[6.1]
  def change
    add_column :readings, :start_time, :datetime
  end
end
