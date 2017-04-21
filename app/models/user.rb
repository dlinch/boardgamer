class User < ApplicationRecord
  has_many :wins
  has_many :plays

  validates :first_name,
            :last_name,
            presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
