class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.integer :track_id
      t.text :note
      t.timestamps
    end

    add_index :notes, :track_id
  end
end
