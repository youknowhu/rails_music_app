class AddLyricsToTracks < ActiveRecord::Migration[5.1]
  def change
    add_column :tracks, :lyrics, :text
  end
end
