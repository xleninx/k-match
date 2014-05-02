FactoryGirl.define do
  sequence :email do |n| 
    "test#{n}@example.com"
  end

  factory :user do
    email
    password '12345678'
    password_confirmation '12345678'
    user_rights Role::Prospective
    association :country


    factory :prospective do
      user_rights Role::Prospective
    end
    factory :current do
      user_rights Role::Current
    end

    factory :leader do
      user_rights Role::Leader
    end

    factory :admin do
      user_rights Role::Admin
    end 
  end
end