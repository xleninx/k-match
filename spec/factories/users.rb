FactoryGirl.define do
  sequence :email do |n| 
    "test#{n}@example.com"
  end

  factory :user do
    email
    password '12345678'
    password_confirmation '12345678'
    user_rights 0
    association :country


    factory :prospective do
      user_rights 0
    end
    factory :current do
      user_rights 1
    end

    factory :leader do
      user_rights 2
    end

    factory :admin do
      user_rights 3
    end 
  end
end