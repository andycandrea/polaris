FactoryGirl.define do
  factory :band do
    sequence(:name) { |n| "band#{n}" }
    frequency 1000.0
  end
end
