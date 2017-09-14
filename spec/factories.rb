FactoryGirl.define do
  factory :user, aliases: [:winner, :player] do
    first_name 'Princess'
    sequence(:last_name) { |n| "Bubblegum#{n}" }
  end

  factory :play do

    users { [build(:player), build(:player)] }
    association :game, strategy: :build

    trait :winner do
        after(:build) { |play| play.update(winner: play.players.first) }
    end
  end


  factory :game do
    name 'Ticket To Ride'
  end
end
