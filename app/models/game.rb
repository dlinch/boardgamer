class Game < ApplicationRecord
  has_many :plays
  has_many :wins, through: :plays

  validates :name, presence: true
end
