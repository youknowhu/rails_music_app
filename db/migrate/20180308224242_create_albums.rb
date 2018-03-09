class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.integer :band_id
      t.string :title
      t.integer :year
      t.string :location, default: 'studio'
      t.timestamps
    end

    add_index :albums, :band_id
  end
end
