class Play < ApplicationRecord
  belongs_to :game
  has_many :user_plays, dependent: :destroy
  has_many :users, through: :user_plays
  belongs_to :winner, foreign_key: 'winner_id', class_name: 'User', optional: true

  # validates :winner_id, presence: true

  def players
    users
  end

  with_options if: :winner do |play|
    play.validate :winner_in_players
  end


  private

  def winner_in_players
    return if players.include?(winner)

    errors.add(:winner_id, :player_included, message: "must be included as a player.")
  end
end
