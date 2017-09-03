class AddWinnerIdToPlay < ActiveRecord::Migration[5.0]
  def change
    add_column :plays, :winner_id, :integer
  end
end
