FactoryGirl.define do
  sequence :name do |n| 
    "country#{n}"
  end

  factory :country do
    name
  end
end