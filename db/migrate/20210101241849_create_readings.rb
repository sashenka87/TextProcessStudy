class CreateReadings < ActiveRecord::Migration[6.1]
  def change
    create_table :readings do |t|
      t.integer :participant_id
      t.index   :participant_id
      t.integer :text_id
      t.string :comment

      t.timestamps
    end
  end
end
