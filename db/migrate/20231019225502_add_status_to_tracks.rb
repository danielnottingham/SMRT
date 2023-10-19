class AddStatusToTracks < ActiveRecord::Migration[7.1]
  def change
    add_column :tracks, :status, :string, default: "pending"
  end
end
