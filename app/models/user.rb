class User < ApplicationRecord
  has_many :user_plays, dependent: :destroy
  has_many :plays, through: :user_plays
  has_many :games, -> { distinct }, through: :plays

  validates :first_name,
            :last_name,
            presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def wins
    plays.where(winner_id: id)
  end
end
