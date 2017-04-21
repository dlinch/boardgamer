class Play < ApplicationRecord
  has_one :game
  has_one :win

  validates :player_ids,
            presence: true

  def players
    User.where(id: player_ids)
  end

  def winner
    win.winner
  end
end
