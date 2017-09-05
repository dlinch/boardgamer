class Play < ApplicationRecord
  belongs_to :game
  has_many :user_plays, dependent: :destroy
  has_many :users, through: :user_plays

  def winner
    User.find_by(id: winner_id)
  end

  def players
    users
  end
end
