class CreatePlays < ActiveRecord::Migration[5.0]
  def change
    create_table :plays do |t|
      t.integer :game_id
      t.integer :player_ids, array: true, default: []

      t.timestamps
    end
  end
end
