class Game < ApplicationRecord
  has_many :wins
  has_many :plays

  validates :name, presence: true
end
