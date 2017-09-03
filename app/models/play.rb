class Play < ApplicationRecord
  belongs_to :game
  has_many :user_plays
  has_many :users, through: :user_plays

  def winner
    User.find(winner_id)
  end
end
