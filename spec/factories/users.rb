FactoryBot.define do
    factory :user do
      sequence(:username) { |n| "user#{n}" }
      email { Faker::Internet.email }
      password { 'password' }
    end
  end