FactoryGirl.define do
  factory :user do
    first_name 'Princess'
    sequence(:last_name) { |n| "Bubblegum#{n}" }
  end

  factory :play do
    player_ids { [build(:user), build(:user)] }
  end

  factory :win do
    user
    play
    game
  end

  factory :game do
    name 'Ticket To Ride'
  end
end
