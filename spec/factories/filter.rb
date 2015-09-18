FactoryGirl.define do
  factory :filter do
    sequence(:name) { |n| "filter#{n}" }
  end
end
