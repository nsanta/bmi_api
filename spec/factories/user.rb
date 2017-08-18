FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'Pass123#*%($' }
    password_confirmation { password }
  end
end
