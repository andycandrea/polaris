FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@dev.null" }
    password 'password'
    password_confirmation 'password'
  end
end
