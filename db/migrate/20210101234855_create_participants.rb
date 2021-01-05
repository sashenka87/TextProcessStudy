class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :class_code
      t.string :section
      t.string :passcode

      t.timestamps
    end
  end
end
