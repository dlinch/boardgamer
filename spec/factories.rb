FactoryGirl.define do
  factory :user do
    first_name 'Princess'
    sequence(:last_name) { |n| "Bubblegum#{n}" }
  end

  factory :play do
    users { [build(:user), build(:user)] }
    association :game, strategy: :build
  end


  factory :game do
    name 'Ticket To Ride'
  end
end
