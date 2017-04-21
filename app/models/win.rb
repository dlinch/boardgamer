class Win < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :play

  def winner
    user
  end
end
