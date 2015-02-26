FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password  "password"
    password_confirmation "password"
    admin_status true
  end

  factory :assignment do
    name "Hello World"
  end
end