FactoryGirl.define do
  sequence :email do |n| 
    "test#{n}@example.com"
  end

  factory :user do
    email
    password '12345678'
    password_confirmation '12345678'
    user_rights Role::PROSPECTIVE
    association :country


    factory :prospective do
      user_rights Role::PROSPECTIVE
    end
    factory :current do
      user_rights Role::CURRENT
    end

    factory :leader do
      user_rights Role::LEADER
    end

    factory :admin do
      user_rights Role::ADMIN
    end 
  end
end