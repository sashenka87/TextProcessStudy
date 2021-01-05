class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.integer :participant_id
      t.integer :text_id
      t.integer :order
      t.string :action_string
      t.string :action_type
      t.integer :time_since_page_load
      t.integer :time_since_tooltip_open
      t.string :comment

      t.timestamps
    end

    add_index :activities, :participant_id
    add_index :activities, :text_id
    add_index :activities, :order
  end
end
