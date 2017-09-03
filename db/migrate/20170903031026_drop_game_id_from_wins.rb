class DropGameIdFromWins < ActiveRecord::Migration[5.0]
  def change
    remove_column :wins, :game_id, :integer
    remove_column :plays, :player_ids, :integer, array: true, default: []
  end
end
