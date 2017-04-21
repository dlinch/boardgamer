class CreateWins < ActiveRecord::Migration[5.0]
  def change
    create_table :wins do |t|
      t.integer :user_id
      t.integer :play_id
      t.integer :game_id

      t.timestamps
    end
  end
end
