class Game < ApplicationRecord
  has_many :plays
  has_many :winners, through: :plays

  validates :name, presence: true

  def user_plays(user)
    plays.joins(:users).where(users: {id: user.id}).count
  end

  def user_wins(user)
    winners.where(id: user.id).count
  end

  def user_win_percent(user)
    wins = user_wins(user)
    user_wins(user) == 0 ? '0%' : "#{(user_plays(user)/wins)*100}%"
  end
end
