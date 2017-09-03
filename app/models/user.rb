class User < ApplicationRecord
  # has_many :wins
  has_many :user_plays
  has_many :plays, through: :user_plays

  validates :first_name,
            :last_name,
            presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
