class CreateUserPlays < ActiveRecord::Migration[5.0]
  def change
    create_table :user_plays do |t|
      t.integer :user_id
      t.integer :play_id

      t.timestamps
    end
  end
end
